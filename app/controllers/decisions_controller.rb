class DecisionsController < ApplicationController

  def create
    @decision = current_user.decisions.build(:user_2_id => params[:user2])
    if @decision.save
      flash[:notice] = "chowdown request sent."
      redirect_to users_path
    else
      flash[:notice] = "unable to send chowdown request."
      redirect_to users_path
    end
  end
end
