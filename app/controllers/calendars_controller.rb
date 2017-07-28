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
    set_match_cal
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

  def set_match_cal
    if @chow.calendar_1_id
      @chow.calendar_2_id = @calendar.id
      @match_cal = Calendar.find(@chow.calendar_1_id)
      @match_cal.dates.each do |date|
        if date == @calendar.dates[0]
          @chow.date = date
        end
      end
    else
      @chow.calendar_1_id = @calendar.id
    end
  end
end
