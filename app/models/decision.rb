class Decision < ApplicationRecord
  belongs_to :user1, :class_name => "User", :foreign_key => "user_1_id"
  belongs_to :user2, :class_name => "User", :foreign_key => "user_2_id"

  validate :cannot_choose_myself
  after_save :check_match

  def cannot_choose_myself
    if user_1_id == user_2_id
      errors.add(:expiration_date, "cannot choose myself")
    end
  end

  def check_match
    decision = Decision.where(user1: self.user2, user2: self.user1)
    unless decision.empty?
      Chow.create(user_1_id: decision.user2.id, user_2_id: decision.user1.id, status: "active")
    end
  end
end
