class Chow < ApplicationRecord
  belongs_to :user1, :class_name => "User", :foreign_key => "user_1_id"
  belongs_to :user2, :class_name => "User", :foreign_key => "user_2_id"
  has_one :availability1, :class_name => "Availability", :foreign_key =>"availability_1_id"
  has_one :availability2, :class_name => "Availability", :foreign_key =>"availability_2_id"
end
