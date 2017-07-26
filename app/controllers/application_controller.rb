require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def pref_meat_icon
    @user = User.find(params[:id])
    if @user.pref_meat
      img = "https://res.cloudinary.com/wafflewitch/image/upload/v1500649828/meat_yes.png"
    else
      img = "https://res.cloudinary.com/wafflewitch/image/upload/v1500649828/meat_no.png"
    end
  end

  def pref_fish_icon
    @user = User.find(params[:id])
    if @user.pref_fish
      img = "https://res.cloudinary.com/wafflewitch/image/upload/v1500649828/fish_yes.png"
    else
      img = "https://res.cloudinary.com/wafflewitch/image/upload/v1500649828/fish_no.png"
    end
  end

  def pref_wheat_icon
    @user = User.find(params[:id])
    if @user.pref_wheat
      img = "https://res.cloudinary.com/wafflewitch/image/upload/v1500649828/wheat_yes.png"
    else
      img = "https://res.cloudinary.com/wafflewitch/image/upload/v1500649828/wheat_no.png"
    end
  end


  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

end
