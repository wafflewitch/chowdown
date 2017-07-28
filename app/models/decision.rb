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
    if self.like == true && self.reply == true
      Chow.create(user_1_id: self.user2.id, user_2_id: self.user1.id, status: "active")
    end
  end
end
