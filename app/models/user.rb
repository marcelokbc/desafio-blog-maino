class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :user_comments, dependent: :destroy
  
  has_one_attached :photo

  enum access: { user: 0, admin: 1 }

  validates :name, presence: true
end
