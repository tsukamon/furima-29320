class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :family_name, :first_name, :family_name_katakana, :first_name_katakana, :birthday, presence: true
  validates :password, format: { with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/, message: 'Include both letters and numbers' }
  validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
  validates :family_name_katakana, :first_name_katakana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' }
end
