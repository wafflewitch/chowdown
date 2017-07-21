class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [ :set_up_profile, :show, :edit, :update, :destroy ]

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      redirect_to root
    end
  end

  def show

    # @preferences = Preference.where(user_id: params[:id])
    # @badges = Badge.where(user_id: params[:id])

  end

  def index
    @users = User.all
    # @all_users_but_current = User.all.where.not("id != ?", current_user.id)
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user.destroy
    redirect_to root
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :pref_meat, :pref_fish, :pref_wheat, :birthday, :gender)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
