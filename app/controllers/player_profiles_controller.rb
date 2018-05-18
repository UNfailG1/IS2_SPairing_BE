class PlayerProfilesController < ApplicationController

  # before_action :authenticate_player_profile
  before_action :set_player_profile, only: [:show, :update, :destroy]

  # GET /player_profiles
  def index
    @player_profiles = PlayerProfile.getBestPlayers().paginate(page: params['page'], per_page: 15)

    render json: @player_profiles, each_serializer: PlayerProfileSimpleSerializer
  end

  # GET /player_profiles/1
  def show
    render json: @player_profile, serializer: PlayerProfileSerializer
  end

  # POST /player_profiles
  def create
    @player_profile = PlayerProfile.new(player_profile_params.merge({pp_spairing_elo: 0.0}))

    if @player_profile.save
      # Call the UserMailer to send a welcome email after save
      PlayerProfileMailer.welcome_email(@player_profile).deliver_later
      render json: @player_profile, status: :created, location: @player_profile
    else
      render json: @player_profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /player_profiles/1
  def update
    @pp_up = PlayerProfile.find(params[:id])
    if params.has_key?(:pp_username)
      @pp_up.pp_username = params[:pp_username]
    end
    if params.has_key?(:password)
      @pp_up.password = params[:password]
    end
    if params.has_key?(:email)
      @pp_up.email = params[:email]
    end
    if params.has_key?(:pp_spairing_elo)
      @pp_up.pp_spairing_elo = params[:pp_spairing_elo]
    end
    if params.has_key?(:location_id)
      @pp_up.location_id = params[:location_id]
    end
    if @pp_up.save
      PlayerProfileMailer.update_profile(@pp_up).deliver_later
      render json: @pp_up, status: :ok, serializer: PlayerProfileOnlySerializer
    else
      render json: @pp_up.errors, status: :unprocessable_entity
    end
  end

  # DELETE /player_profiles/1
  def destroy
    @player_profile.destroy
  end

  def friend_status
    sender = current_player_profile
    receiver = PlayerProfile.find(params[:receiver_id])

    toRender = {
      sender_friends: sender.friends.pluck(:id),
      receiver_friends: receiver.friends.pluck(:id)
    }

    render json: toRender, status: :ok, serializer: nil
  end

  def friend_request
    sender = current_player_profile
    receiver = PlayerProfile.find(params[:receiver_id])
    if !sender.friends.include? receiver
      sender.friends.push(receiver)
      # Falta enviar la notificacion en la pagina
      if receiver.friends.include? sender
        PlayerProfileMailer.request_accepted_email(sender, receiver).deliver_later
      else
        PlayerProfileMailer.request_sended_email(sender, receiver).deliver_later
      end
    end
    toRender = {
      sender_friends: sender.friends.pluck(:id),
      receiver_friends: receiver.friends.pluck(:id)
    }

    render json: toRender, status: :ok, serializer: nil
  end

  def remove_friend
    sender = current_player_profile
    receiver = PlayerProfile.find(params[:receiver_id])
    if sender.friends.include? receiver
      sender.friends.delete(receiver)
    end
    if receiver.friends.include? sender
      receiver.friends.delete(sender)
    end

    toRender = {
      sender_friends: sender.friends.pluck(:id),
      receiver_friends: receiver.friends.pluck(:id)
    }

    render json: toRender, status: :ok, serializer: nil
  end

  def block_player
    blocker = current_player_profile
    blocked = PlayerProfile.find(params[:blocked_player_id])

    if !blocker.blocked_players.include?
      blocker.blocked_players.push(blocked)
    end

    render json: blocker, status: :ok, serializer: PlayerProfileSerializer

  end

  def block_status
    player = PlayerProfile.find(params[:player_id])
    blocked = {
      player_blocked_players: player.blocked_players.pluck(:id)
    }
    render json: blocked, status: :ok, serializer: nil

  end

  def usernames_like
    profiles = PlayerProfile.getByUsernameLike(params[:username])
      .paginate(page: params['page'], per_page: 5)
    render json: profiles, status: :ok, each_serializer: PlayerProfileOnlySerializer
  end

  def suggested_profiles
    profiles = PlayerProfile.getSimilarProfiles(current_player_profile)
    render json: profiles, status: :ok, each_serializer: nil
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_player_profile
    @player_profile = PlayerProfile.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def player_profile_params
      params.require(:player_profile).permit(:pp_username, :email, :password, :password_confirmation)
  end
end
