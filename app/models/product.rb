class Product < ApplicationRecord
  has_many :cart_products
  has_many :order_details
  belongs_to :genre
  has_one_attached :product_image

  def get_product_image
    (product_image.attached?) ? product_image : "sample.png"
  end

end
