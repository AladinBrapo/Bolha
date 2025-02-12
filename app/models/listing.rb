class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one_attached :image

  validates :category, :title, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }

  before_save :round_price

  private

  def round_price
    self.price = price.round(2) if price.present?
  end
end

