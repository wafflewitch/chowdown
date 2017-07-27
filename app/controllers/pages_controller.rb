class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if user_signed_in?
      if current_user[:age].nil?
        redirect_to after_signup_path(:add_age)
      else
        redirect_to users_path
      end
    end
  end
end
