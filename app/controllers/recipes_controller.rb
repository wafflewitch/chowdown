class RecipesController < ApplicationController
  require 'json'
  require 'open-uri'
  skip_before_action :authenticate_user!, only: :home
  before_action :set_user, only: [ :new, :create ]
  before_action :set_chow, only: [ :index ]

  def new
  end

  def index
    @user1_recipes = Recipe.where(user_id: @chow.user_1_id)
    @user2_recipes = Recipe.where(user_id: @chow.user_2_id)
    @recipes = @user1_recipes + @user2_recipes
  end

  def show
  end

  def destroy
  end

  def search
    @query = params[:query]
    if @query
      response = open("https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/search?number=4&offset=0&query=" + @query,
      {
        "X-Mashape-Key" => ENV["MASHAPE_API_KEY"],
        "Accept" => "application/json"
      })
      result_json = JSON.parse(response.read)
      image_url = "https://spoonacular.com/recipeImages/"
      @title = result_json["results"][0]["title"]
      @photo = image_url + result_json["results"][0]["image"]
    end
  end

private

  def set_user
    @user = User.find(current_user[:id])
  end

  def set_chow
    @chow = Chow.find(params[:chow_id])
  end
end
