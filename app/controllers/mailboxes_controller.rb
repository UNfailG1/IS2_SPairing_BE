class MailboxesController < ApplicationController

  before_action :authenticate_player_profile
  before_action :set_mailbox, only: [:show, :update, :destroy]

  # GET /mailboxes
  def index
    # @mailboxes = Mailbox.paginate(page: params['page'], per_page: 15)
    @mailboxes = Mailbox.getByPlayerProfileName(current_player_profile.id)
    render json: @mailboxes, each_serializer: MailboxSerializer
  end

  # GET /mailboxes/1
  def show
    render json: @mailbox, serializer: MailboxSerializer
  end

  # POST /mailboxes
  def create
    puts "paramtros ------ #{params}"
    @mailbox = Mailbox.new({sender_id: current_player_profile.id}.merge(mailbox_params))
    # @mailbox.sender_id = current_player_profile.id
    # @mailbox.receiver_id = params[:mailbox][:receiver_id]
    # @mailbox.mail_message = params[:mailbox][:mail_message]
    puts @mailbox.mail_message

    if @mailbox.save
      MailboxMailer.message_received(@mailbox).deliver_later
      render json: @mailbox, status: :created
    else
      render json: @mailbox.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mailboxes/1
  def update
    if @mailbox.update(mailbox_params)
      render json: @mailbox
    else
      render json: @mailbox.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mailboxes/1
  def destroy
    @mailbox.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mailbox
      @mailbox = Mailbox.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mailbox_params
      params.require(:mailbox).permit(:receiver_id, :mail_message)
    end
end
