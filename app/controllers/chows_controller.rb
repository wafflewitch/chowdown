class ChowsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_chow, only: [ :show, :edit, :update, :destroy, :status_rejected, :status_accepted, :status_finished, :status_finished ]
  before_action :set_user, only: [ :new, :create, :index, :status_rejected, :status_accepted ]

  def new
    @chow = Chow.new
    @user = current_user
    @chow.user1 = current_user
  end

  def create
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

  def show
    @chow = Chow.find(set_chow)
    @chow.user1 = current_user
  end


  def index
    user1 = Chow.where(user_1_id: @user.id)
    user2 = Chow.where(user_2_id: @user.id)

    if params[:query] == "active" || params[:query] == "finalized"
      @active = true
      @finalized_chows = Chow.where(status: "finalized" ,user_2_id: @user.id).or(Chow.where(status: "finalized", user_1_id: @user.id))
      @active_chows = Chow.where(status: "active" ,user_2_id: @user.id).or(Chow.where(status: "active", user_1_id: @user.id))
    elsif params[:query] == "finished"
      @finished_chows = Chow.where(status: params[:query],user_1_id: @user.id).or(Chow.where(status: params[:query], user_2_id: @user.id))
    else
      @chows = user1 + user2
    end

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
    params.require(:chow).permit(:user_1_id, :user_2_id)
  end

  def set_chow
    @chow = Chow.find(params[:id])
  end

  def set_user
    @user = User.find(current_user[:id])
  end
end
