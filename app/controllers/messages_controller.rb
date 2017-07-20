class MessagesController < ApplicationController
  respond_to :html, :js

  before_action :set_chow, only:[:index]
  before_action :authenticate_user!

  def index
    # show all messages
    @messages = @chow.messages.all
    @message = current_user.messages.build
    #sender
    # @sender = User.find(current_user.id)
    # #recipient
    # @recipient = User.find(@chow)
  end

  def refresh_messages
    @chow = Chow.find(params[:id])
    @messages = @chow.messages.where("created_at > ?", 3.second.ago)
    respond_to do |format|
      format.js
    end
  end

  def create
    @message = current_user.messages.build(message_params)
    @message.chow_id = 1
    @message.recipient_id = 3

    respond_to do |format|
      if @message.save
        format.js
      end
    end
    # respond_with(@message)
  end

  private

  def set_chow
    @chow = Chow.find(params[:chow_id])
  end


  def message_params
    params.require(:message).permit(:content, :sender_id, :recipient_id, :chow_id)
  end

end
