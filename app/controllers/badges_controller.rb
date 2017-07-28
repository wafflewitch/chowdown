class BadgesController < ApplicationController
  before_action :set_user, except: [ :update, :index ]
  before_action :set_chow_and_partner, only: [ :update, :index ]
  before_action :set_badge, only: [ :show, :edit, :update, :destroy ]

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    @badge[:level] = params[:badge][:level]
    @badge.user = @user
    @badge.save!
  end

  def index
    @badges = Badge.where(user_id: @user.id)
  end

  def show
  end

  def edit
  end

  def update
    @badge[:level] += 1
    @badge.save!
    redirect_to user_chows_path(@user, :query => "finished")
  end

  def destroy
    @badge.destroy
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(current_user[:id])
  end

  def set_chow_and_partner
    set_user
    @chow = Chow.find(params[:chow_id])
    if @user == User.find(@chow.user_1_id)
      @partner = User.find(@chow.user_2_id)
    else
      @partner = User.find(@chow.user_1_id)
    end
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:user_id, :name, :category)
  end
end
