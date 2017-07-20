class BadgesController < ApplicationController
  before_action :set_user
  before_action :set_badge, only: [ :show, :edit, :update, :destroy ]

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    @badge.user = @user
    if @badge.save!
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def index
    @badges = Badge.where(users_id: @user.id)
  end

  def show
  end

  def edit
  end

  def update
    @badge.update(badge_params)
    redirect_to user_path(@user)
  end

  def destroy
    @badge.destroy
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(current_user[:id])
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:users_id, :name)
  end
end
