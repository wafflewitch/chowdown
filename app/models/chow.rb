class Chow < ApplicationRecord
  belongs_to :user1, :class_name => "User", :foreign_key => "user_1_id"
  belongs_to :user2, :class_name => "User", :foreign_key => "user_2_id"
  has_one :calendar1, :class_name => "Calendar", :foreign_key =>"calendar_1_id"
  has_one :calendar2, :class_name => "Calendar", :foreign_key =>"calendar_2_id"
  has_many :messages, dependent: :destroy

  after_create :mail_chowdown_active

  # i'm not sure why we need this??
  def get_user(id)
    if self.user_1_id == id
      return self.user2
    else
      return self.user1
    end
  end

  private

  def mail_chowdown_active
    ChowMailer.chowdown_active_user1(self).deliver_now
    ChowMailer.chowdown_active_user2(self).deliver_now
  end

end
