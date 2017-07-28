class ChowsController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_chow, only: [ :show, :edit, :update, :destroy, :set_user, :status_finalized, :status_finished ]
  before_action :set_user, only: [ :new, :create, :index, :destroy ]

  def new
    @chow = Chow.new
  end

  def create
    @chow = Chow.new(chow_params)
    @chow[:status] = "active"
    @chow.user1 = current_user
    @chow.user2 = User.find(chow_params[:user_2_id])
    users_same = @chow.user1 == @chow.user2
    if !users_same
      @chow.save!
      # redirect_to new_user_chow_calendar_path(@user, @chow)
    # else
    #   render :new
    end
  end

  def show
    @chow = Chow.find(set_chow)
    # @chow.user1 = current_user
  end


  def index
    user1_chows = Chow.where(user_1_id: @user.id)
    user2_chows = Chow.where(user_2_id: @user.id)

    #if @user == User.find(@chow.user_1_id)
    #   @partner = User.find(@chow.user_2_id)
    # else
    #   @partner = User.find(@chow.user_1_id)
    #end

    if params[:query] == "active" || params[:query] == "finalized"
      @active = true
       @btn = "finalized"
      @finalized_chows = Chow.where(status: "finalized", user_2_id: @user.id).or(Chow.where(status: "finalized", user_1_id: @user.id))
      @active_chows = Chow.where(status: "active", user_2_id: @user.id).or(Chow.where(status: "active", user_1_id: @user.id))
    elsif params[:query] == "finished"
      @btn = "finished"
      @finished_chows = Chow.where(status: params[:query], user_1_id: @user.id).or(Chow.where(status: params[:query], user_2_id: @user.id))
    else
      @chows = user1_chows + user2_chows
    end

  end

  def edit
  end

  def update
    if params[:status] == "finalized"
      status_finalized
    elsif params[:status] == "finished"
      status_finished
    end
    @chow.save!
    redirect_to user_chows_path(@user)
  end

  def destroy
    @chow.destroy
    redirect_to user_chows_path(@user)
  end

  def status_finalized
    @chow.status = "finalized"
  end

  def status_finished
    @chow.status = "finished"
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
