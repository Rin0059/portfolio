class LiquorComment < ApplicationRecord
  belongs_to :user
  belongs_to :liquor

  validates :comment, presence: true
end
