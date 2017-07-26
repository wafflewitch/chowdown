class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_user, only: [ :new, :create ]
  before_action :set_chow, only: [ :index ]

  def new
  end

  def destroy
  end

  def show
  end

  def index
    @user1_recipes = Recipe.where(user_id: @chow.user_1_id)
    @user2_recipes = Recipe.where(user_id: @chow.user_2_id)
    @recipes = @user1_recipes + @user2_recipes
  end

private

  def set_user
    @user = User.find(current_user[:id])
  end

  def set_chow
    @chow = Chow.find(params[:chow_id])
  end


end
