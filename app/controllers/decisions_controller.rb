class DecisionsController < ApplicationController
  before_action :set_user1, only: [ :create ]
  before_action :set_all_users_but_me, only: [:create]
  before_action :find_decision, only: [ :create ]

  def new
    @decision = Decision.new
  end

  def create
    if @decision.nil?
      @decision = Decision.new()
      @decision.user2 = User.find(params[:user_2_id])
      @decision.user1 = current_user
       @decision.like = params[:decision]
    else
      @decision.reply = params[:decision]
    end
    if @decision.save
      respond_to do |format|
        format.html { redirect_to users_path }
        format.js
      end
    else
      #redirect_to users_path
    end
  end

  private

  def find_decision
    @decision = User.find(params['user_2_id']).decisions.where(user_2_id: current_user.id).first
  end

  def decision_params
    params.permit(:like)
  end

  def set_user1
    @user1 = User.find(current_user.id)
  end

  def set_all_users_but_me
    @all_users_but_current = User.where
                                  .not("id = ?", current_user.id)
                                  .reject{ |u| u.id == current_user.id }
    # @all_users_but_current = get_unviewed(current_user)
    @all_users_but_current = @all_users_but_current.shuffle.first
  end

end


