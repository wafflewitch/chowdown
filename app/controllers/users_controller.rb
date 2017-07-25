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
    @users = get_unviewed(current_user)
    @user = @users.shuffle.first
    # @all_users_but_current = User.all.where.not("id != ?", current_user.id)
  end

  def edit
  end

  def update
    if params["max_distance"]
      min_age = params["age_range"].split(',')[0].to_i
      max_age = params["age_range"].split(',')[1].to_i
      gender_pref = params["gender_pref"]
      max_distance = params["max_distance"].to_i
      if params["dating_pref"] == "false"
        dating = false
      else
        dating = true
      end
      @user.update(min_age: min_age, max_age: max_age, dating: dating,
        gender_pref: gender_pref, max_distance: max_distance )
    else
      @user.update(user_params)
      redirect_to user_path(@user)
    end
  end

  def destroy
    @user.destroy
    redirect_to root
  end

  def get_unviewed(user)
    decided_ids = []
    decided_ids << user.id

    user.decisions.each do |decision|
      decided_ids << decision.user1.id unless decision.user1 == user
      decided_ids << decision.user2.id unless decision.user2 == user
    end

    users = User.all.reject { |u| decided_ids.include?(u.id)}
    return users
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
