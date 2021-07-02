class Genre < ApplicationRecord
  has_many :liquors
   validates :name, presence: true
end
