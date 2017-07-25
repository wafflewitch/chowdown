class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :add_age, :add_gender, :add_address, :add_prefs, :add_tags, :add_bio

  def show
    @user = current_user
    @current_step = current_step_index + 1
    @total_steps = steps.count
    render_wizard
  end

  def update
    @user = current_user
    @user.update(user_params)
    render_wizard @user
  end

  private

  def finish_wizard_path
    user_path(current_user)
  end

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :age, :address, :gender, :pref_meat, :pref_fish, :pref_wheat, :tag1, :tag2, :tag3, :tag4, :tag5, :bio)
  end
end
