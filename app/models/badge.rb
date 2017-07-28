class Badge < ApplicationRecord
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  attr_accessor :level
end
