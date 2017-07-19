class DietPref < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
