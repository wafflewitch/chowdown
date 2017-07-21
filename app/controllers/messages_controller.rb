class MessagesController < ApplicationController
  respond_to :html, :js

  before_action :set_chow, only:[:index, :create]
  before_action :authenticate_user!

  def index
    # show all messages
    @messages = @chow.messages.all
    @messages = @messages.sort_by(&:created_at)
    @messages = @messages.last(10)

    if current_user.id == @chow.user_1_id
      recipient_id = @chow.user_2_id
      @recipient = User.find(recipient_id)
    else
      recipient_id = @chow.user_1_id
      @recipient = User.find(recipient_id)
    end

    @message = current_user.messages.build
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

    respond_to do |format|
      if @message.save
        format.js
      end
    end

  end

  private

  def set_chow
    @chow = Chow.find(params[:chow_id])
  end


  def message_params
    params.require(:message).permit(:content, :sender_id, :recipient_id, :chow_id)
  end

end
