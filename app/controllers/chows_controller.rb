class ChowsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_chow, only: [ :show, :edit, :update, :destroy ]
  before_action :set_user, only: [ :new, :create, :index ]

  def new
    @chow = Chow.new
  end

  def create #user 1 user 2
    @chow = Chow.new(chow_params)
    @chow.user_1_id = current_user
    @chow.user_2_id = User(params[:user_2_id])
    @chow.save!

  end

  def show #user 1 und user 2
    @chow = Chow.find(set_chow)
    @chow.user_1_id = current_user
    @chow.user_2_id = User(params[:user_2_id])
    @booking.tool = @tool
  end

end


def chow_params
    params.require(:chow).permit(:user_2_id)
  end

  def set_chow
    @chow = Chow.find(params[:id])
  end

  def set_user
    @user = User.find(current_user[:id])
  end
