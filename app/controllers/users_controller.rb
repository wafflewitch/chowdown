class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_age
  before_action :set_user, only: [ :show, :edit, :update, :destroy ]
  helper_method :pref_meat_icon, :pref_fish_icon, :pref_wheat_icon

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

    # @badges = Badge.where(user_id: params[:id])

  end

  def index

    ids = Decision.where(user1: current_user.id).collect(&:user_2_id)

    if params[:matchingPref] == 'true'
      @users = User.near([current_user.latitude.to_f, current_user.longitude.to_f], params[:maxDistance], units: :km, :order => 'distance')
                    .where(dating: params[:datingPref])
                    .where("min_age >= ?", params[:ageMin].to_i)
                    .where("max_age <= ?", params[:ageMax].to_i)
                    .where.not(id: ids)
      if params[:gender] == "women" || params[:gender] == "men"
        @users.where(gender_pref: params[:gender])
      end
      respond_to do |format|
        format.html {render users_path}
        format.js
      end
    else
      @users = User.where.not(id: ids).where.not("id = ?", current_user.id)
    end
  end

  def edit
    @user = current_user
  end

  def update
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
