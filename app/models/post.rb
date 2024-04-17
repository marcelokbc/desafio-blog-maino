class Post < ApplicationRecord
  belongs_to :user
  has_many :user_comments, dependent: :destroy
  has_one_attached :banner
  
  validates :title, :subtitle, :content, presence: true
end
