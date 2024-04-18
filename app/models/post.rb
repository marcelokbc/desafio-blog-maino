class Post < ApplicationRecord
  belongs_to :user
  has_many :user_comments, dependent: :destroy

  has_one_attached :banner
  has_rich_text :content
  
  validates :title, :subtitle, :content, :banner, presence: true
end
