class MailboxesController < ApplicationController

  before_action :authenticate_player_profile
  before_action :set_mailbox, only: [:show, :update, :destroy]

  # GET /mailboxes
  def index
    # @mailboxes = Mailbox
    case params[:section]
    when 'Inbox'
      @mailboxes = Mailbox.getInbox(current_player_profile.id)
        .paginate(page: params['page'], per_page: 25)

    when 'Sent'
      @mailboxes = Mailbox.getSent(current_player_profile.id)
        .paginate(page: params['page'], per_page: 25)

    end
    render json: @mailboxes, each_serializer: MailboxSerializer
  end

  # GET /mailboxes/1
  def show
    render json: @mailbox, serializer: MailboxSerializer
  end

  # POST /mailboxes
  def create
    with_error = []
    mail = mailbox_params
    puts mail[:recipient_ids]
    mail[:recipient_ids].each { |receiver_id|

      @mailbox = Mailbox.new(
        sender_id: current_player_profile.id,
        receiver_id: receiver_id,
        mail_subject: mail[:mail_subject],
        mail_message: mail[:mail_message]
      )

      if @mailbox.save
        MailboxMailer.message_received(@mailbox).deliver_later
      else
        with_error.push(receiver_id)
      end
    }
    render json: with_error, status: :ok
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
      params.require(:mailbox).permit(:mail_subject, :mail_message, recipient_ids: [])
    end
end
