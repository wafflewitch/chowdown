class Chow < ApplicationRecord
  belongs_to :user1, :class_name => "User", :foreign_key => "user_1_id"
  belongs_to :user2, :class_name => "User", :foreign_key => "user_2_id"
  has_one :calendar1, :class_name => "Calendar", :foreign_key =>"calendar_1_id"
  has_one :calendar2, :class_name => "Calendar", :foreign_key =>"calendar_2_id"
  has_many :messages
  after_create :send_request_email
  # after_update :send_status_accepted
  # after_update :send_status_rejected


  def send_request_email
    ChowMailer.chowdown_request(self).deliver_now
    self.status = "pending"
    self.save!
  end

  def send_status_accepted
    ChowMailer.chowdown_accepted(self).deliver_now
  end

  def send_status_rejected
    ChowMailer.chowdown_rejected(self).deliver_now
  end


end
