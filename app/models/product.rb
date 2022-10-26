class Product < ApplicationRecord
  has_many :cart_products
  has_many :order_details
  belongs_to :genre
  has_one_attached :product_image

  validates :name, presence: true
  validates :description, presence: true
  # validates :genre_id, presence: true
  validates :price, presence: true
  validates :is_active, presence: true

  paginates_per 8

  def get_product_image
    (product_image.attached?) ? product_image : "sample.png"
  end

  def add_tax_price
    (self.price*1.10).round
  end

end
