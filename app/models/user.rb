class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :liquors
  has_many :genres
  has_many :liquor_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  enum users_srarus: { 有効: true, 退会: false }

  validates :name, :email, presence: true

  #退会
  def active_for_authentication?
    super && self.user_status
  end
end
