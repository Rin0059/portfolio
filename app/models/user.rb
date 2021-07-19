class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :liquors
  has_many :genres
  has_many :liquor_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  enum users_srarus: { 有効: false, 退会: true }

  validates :name, :email, presence: true
end
