class CartProduct < ApplicationRecord

  has_many :products
  belongs_to :customer
  def subtotal
    product.price*amount
  end
end
