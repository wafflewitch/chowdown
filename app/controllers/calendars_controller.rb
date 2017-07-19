class CalendarsController < ApplicationController
  before_action :set_user
  before_action :set_chow
  before_action :set_calendar, only: [ :index, :show, :edit, :update, :destroy ]

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.user = @user
  end

  def edit
  end

  def update
    @calendar.update(calendar_params)
    redirect_to user_path(@user)
  end

  def index
  end

  def show
  end

  def destroy
    @calendar.destroy
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(current_user[:id])
  end

  def set_chow
    @chow = Chow.find(user_id: current_user[:id])
  end

  def set_calendar
    @calendar = Calendar.find(params[:id])
  end

  def calendar_params
    params.require(:calendar).permit(:user_id, :dates)
  end
end
