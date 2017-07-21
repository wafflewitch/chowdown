class ChowsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_chow, only: [ :show, :edit, :update, :destroy, :status_rejected, :status_accepted, :status_finished, :status_finished ]
  before_action :set_user, only: [ :new, :create, :index, :status_rejected, :status_accepted ]

  def new
    @chow = Chow.new
    @user = current_user
    @chow.user1 = current_user
  end

  def create #user 1 user 2
    @chow = Chow.new(chow_params)
    @user = current_user
    @chow.user1 = current_user
    @chow.user2 = User.find(chow_params[:user_2_id])
    users_same = @chow.user1 == @chow.user2
    if @chow.save! && !users_same
      redirect_to new_user_chow_calendar_path(@user, @chow)
    else
      render :new
    end
  end

  def show #user 1 und user 2
    @chow = Chow.find(set_chow)
    @chow.user1 = current_user
  end


  def index
    @chows_user1 = Chow.where(user_1_id: @user.id)
    @chows_user2 = Chow.where(user_2_id: @user.id)
    @chows = @chows_user1 + @chows_user2

      if params[:query] == "pending"
       @chows = by_status_pending
      else
       @chows = @chows_user1 + @chows_user2
      end

  end

  def by_status_pending
      Chow.where(status: params[:query]) && @chows_user2
  end

  def edit
  end

  def update
    if params[:status] == "accepted"
      status_accepted
    elsif params[:status] == "rejected"
      status_rejected
    end
    redirect_to user_chow_path(@chow)
  end

  def destroy
    @chow.destroy
    redirect_to user_chows_path(@chow.user1)
  end

  def status_accepted
    @chow.status = "accepted"
    @chow.save!
    @chow.send_status_accepted
  end

  def status_rejected
    @chow.status = "rejected"
    @chow.save!
  end

  def status_detailed
    @chow.status = "detailed"
    @chow.save!
  end

  def status_finished
    @chow.status = "finished"
    @chow.save!
  end

  private

  def chow_params
    params.require(:chow).permit(:user_1_id, :user_2_id, :status)
  end

  def set_chow
    @chow = Chow.find(params[:id])
  end

  def set_user
    @user = User.find(current_user[:id])
  end
end
