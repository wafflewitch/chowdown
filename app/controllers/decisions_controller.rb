class DecisionsController < ApplicationController
  before_action :set_user1, only: [ :create ]

  def create
    @decision = Decision.new(user_2_id: params[:user_2_id], like: params[:like])
    @decision.user1 = @user1
    if @decision.save
      if @decision.like == true
        flash[:notice] = "Saved! We'll let you know if #{@decision.user2.first_name} matches with you."
      else
        flash[:notice] = "OK, you won't be matched with #{@decision.user2.first_name} for now."
      end
      redirect_to users_path
    else
      flash[:notice] = "Sorry, something went wrong. Please try again later."
      redirect_to users_path
    end
  end

  private

  def set_user1
    @user1 = User.find(current_user.id)
  end
end
