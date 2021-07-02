class Liquor < ApplicationRecord
  belongs_to :user
  belongs_to :genre
	has_many :liquor_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end

    attachment :image
end
