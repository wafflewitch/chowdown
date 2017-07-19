class PreferencesController < ApplicationController
  before_action :set_user
  before_action :set_pref, only: [ :show, :edit, :update, :destroy ]

  def new
    @pref = DietPref.new
  end

  def create
    @pref = DietPref.new(pref_params)
    @pref.user = @user
    if @pref.save!
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def index
    @prefs = DietPref.where(users_id: @user.id)
  end

  def show
  end

  def edit
  end

  def update
    @pref.update(pref_params)
    redirect_to user_path(@user)
  end

  def destroy
    @pref.destroy
    redirect_to user_path(@user)
  end

  private

  def set_user
    @user = User.find(current_user[:id])
  end

  def set_pref
    @pref = DietPref.find(params[:id])
  end

  def pref_params
    params.require(:diet_pref).permit(:users_id, :name, :icon)
  end
end
