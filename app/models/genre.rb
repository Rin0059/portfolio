class Genre < ApplicationRecord
  has_many :liquors
   validates :name, presence: true

   attachment :image
end
