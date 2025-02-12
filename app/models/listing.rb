class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :image

  validates :title, :description, :price, presence: true
end

