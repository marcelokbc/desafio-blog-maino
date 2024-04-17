class UserComment < ApplicationRecord
  belongs_to :post
  belongs_to :user, optional: true

  validates :content, presence: true
end
