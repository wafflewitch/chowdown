class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_age
  before_action :set_user, only: [ :show, :edit, :update, :destroy ]

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to after_signup_path
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
    params.require(:user).permit(:email, :password, :first_name, :last_name, :age, :address, :gender, :pref_meat, :pref_fish, :pref_wheat, :tag1, :tag2, :tag3, :tag4, :tag5, :bio)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def check_age
    redirect_to after_signup_path(:add_age) if current_user[:age].nil?
  end
end
