class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,# :registerable, ← admin に対して自由に sign_up されたくないので不要部分をコメントアウト。
         :recoverable, :rememberable, :validatable
end
