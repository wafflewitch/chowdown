class MessagesController < ApplicationController
  respond_to :html, :js
  before_action do
    @chow = Chow.find(params[:chow_id])
    :authenticate_user!
  end

  def index
    # show all messages
    @messages = @chow.messages.all
    @new_message = current_user.messages.build
    #sender
    # @sender = User.find(current_user.id)
    # #recipient
    # @recipient = User.find(@chow)
  end

  def create
    @message = current_user.messages.build(message_params)
    @message.chow_id = 1
    @message.recipient_id = 3
    if @message.save
      sync_new @message
    else
      render 'new'
    end
    respond_with(@message)
  end

  private

  def message_params
    params.require(:message).permit(:content, :sender_id, :recipient_id, :chow_id)
  end

end
