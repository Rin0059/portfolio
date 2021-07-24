class Liquor < ApplicationRecord
  belongs_to :user,optional: true #admin側でも新規登録できるように"optional: true"を記述
  belongs_to :genre
	has_many :liquor_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end

    attachment :image
end
