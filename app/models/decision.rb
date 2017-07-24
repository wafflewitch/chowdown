class Decision < ApplicationRecord
  belongs_to :user1, class_name: "User"
  belongs_to :user2, class_name: "User"

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
      Chow.create(user_1_id: user_1_id, user_2_id: user_2_id, status: "accepted")
    end
  end
end
