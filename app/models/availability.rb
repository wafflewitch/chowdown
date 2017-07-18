class Availability < ApplicationRecord
  belongs_to :user
  belongs_to :chow, :class_name => "Chow", :foreign_key => "availability_1_id"
  belongs_to :secondary_chow, :class_name => "Chow", :foreign_key => "availability_2_id"


end
