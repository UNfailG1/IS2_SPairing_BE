class PlayerProfilesController < ApplicationController

  before_action :authenticate_player_profile, except: :create
  before_action :set_player_profile, only: [:show, :destroy]

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
    puts " Holi? #{params[:location_id]}"
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
      id = params[:location_id]
      @pp_up.location_id = (id != 0) ? id : nil
    end

    if @pp_up.save
      PlayerProfileMailer.update_profile(@pp_up).deliver_later
      render json: @pp_up, status: :ok, serializer: PlayerProfileSerializer
    else
      render json: @pp_up.errors, status: :unprocessable_entity
    end
  end

  # DELETE /player_profiles/1
  def destroy
    @player_profile.destroy
  end

  def relation_status
    current = current_player_profile
    player = PlayerProfile.find(params[:player_id])

    toRender = {
      current: {
        c_friends: current.friends.pluck(:id),
        c_locks: current.blocked_players.pluck(:id)
      },
      player: {
        p_friends: player.friends.pluck(:id),
        p_locks: player.blocked_players.pluck(:id)
      }
    }

    render json: toRender, status: :ok, serializer: nil
  end

  def friend_request
    current = current_player_profile
    player = PlayerProfile.find(params[:player_id])
    if !current.friends.include? player
      current.friends.push(player)
      # Falta enviar la notificacion en la pagina
      if player.friends.include? current
        PlayerProfileMailer.request_accepted_email(current, player).deliver_later
      else
        PlayerProfileMailer.request_sended_email(current, player).deliver_later
      end
    end

    toRender = {
      current_friends: current.friends.pluck(:id),
      player_friends: player.friends.pluck(:id),
    }

    render json: toRender, status: :ok, serializer: nil
  end

  def remove_friend
    current = current_player_profile
    player = PlayerProfile.find(params[:player_id])
    if current.friends.include? player
      current.friends.delete(player)
    end
    if player.friends.include? current
      player.friends.delete(current)
    end

    toRender = {
      current_friends: current.friends.pluck(:id),
      player_friends: player.friends.pluck(:id),
    }

    render json: toRender, status: :ok, serializer: nil
  end

  def block_player
    current = current_player_profile
    player = PlayerProfile.find(params[:player_id])

    if !current.friends.include? player
      current.friends.delete(player)
    end

    if !player.friends.include? current
      player.friends.delete(current)
    end

    if !current.blocked_players.include? player
      current.blocked_players.push(player)
    end

    toRender = {
      current: {
        c_friends: current.friends.pluck(:id),
        c_locks: current.blocked_players.pluck(:id)
      },
      player: {
        p_friends: player.friends.pluck(:id),
        p_locks: player.blocked_players.pluck(:id)
      }
    }

    render json: toRender, status: :ok, serializer: nil
  end

  def unblock_player
    current = current_player_profile
    player = PlayerProfile.find(params[:player_id])

    if current.blocked_players.include? player
      current.blocked_players.delete(player)
    end

    render json: player, status: :ok, serializer: PlayerProfileSimpleSerializer
  end

  def usernames_like
    profiles = PlayerProfile.getByUsernameLike(params[:username])
      .paginate(page: params['page'], per_page: 5)
    render json: profiles, status: :ok, each_serializer: PlayerProfileSimpleSerializer
  end

  def suggested_profiles
    profiles = PlayerProfile.getSimilarProfiles(current_player_profile).paginate(page: params['page'], per_page: 5)
    render json: profiles, status: :ok, each_serializer: nil
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_player_profile
    @player_profile = PlayerProfile.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def player_profile_params
      params.require(:player_profile).permit(:pp_username, :email, :password, :password_confirmation, :location_id)
  end
end
