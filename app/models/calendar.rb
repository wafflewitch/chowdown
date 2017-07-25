class Calendar < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :chow
end
