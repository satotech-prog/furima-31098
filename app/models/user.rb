class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }
    validates :password_confirmation, format: { with: /\A[a-zA-Z0-9]+\z/ }
    validates :lastname, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :lastname_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :firstname_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end

  has_many :items
  has_many :buys
end
