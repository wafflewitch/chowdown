class CalendarsController < ApplicationController
  before_action :set_user
  before_action :set_chow
  before_action :set_calendar, only: [ :index, :show, :edit, :update, :destroy ]

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new
    @calendar.user = @user
    @calendar.chow = @chow
    dates = params["date_one"].split('  ')
    @calendar.dates = dates
    @calendar.save!
    if @chow.user1 == current_user
      @chow.calendar_1_id = @calendar.id
      @calendar_partner = Calendar.find(@chow.calendar_id_2)
    else
      @chow.calendar_2_id = @calendar.id
      @calendar_partner = Calendar.find(@chow.calendar_id_1)
    end
    @calendar.dates.each do |date|
      if date == @calendar_partner[0]
        @chow.date = date
      elsif date == @calendar_partner[1]
        @chow.date = date
      elsif date == @calendar_partner[2]
        @chow.date = date
      end
    end
    @chow.save!
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
    @user = User.find(params[:user_id])
  end

  def set_chow
    @chow = Chow.find(params[:chow_id])
  end

  def set_calendar
    @calendar = Calendar.find(params[:id])
  end

  def calendar_params
    params.require(:calendar).permit(:user_id, :chow_id, :dates)
  end
end
