class MessagesController < ApplicationController
  before_action do
    @chow = Chow.find(params[:chow_id])
  end

  def index
    # show all messages
    @messages = @chow.messages.all
  end

  def new
    # create new message
    @message = @chow.messages.new
  end

  def create
    @message = @chow.messages.new(message_params)
    if @message.save
      redirect_to user_chow_messages_path(@chow)
    end
  end


  private

  def message_params
    params.require(:message).permit(:content, :sender_id, :recipient_id)
  end

end
