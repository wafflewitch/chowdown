class PreferencesController < ApplicationController
  before_action :set_user

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_user
    @user = User.find(current_user[:id])
  end
end
