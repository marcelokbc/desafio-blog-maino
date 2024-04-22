class Post < ApplicationRecord
  belongs_to :user
  has_many :user_comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  
  has_one_attached :banner
  has_rich_text :content
  
  validates :title, :subtitle, :content, :banner, presence: true
end
