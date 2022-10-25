class CartProduct < ApplicationRecord

  has_many :products
  belongs_to :customer

  validates :product_id, presence: true
  validates :customer_id, presence: true
  validates :amount, presence: true

  def subtotal
    Product.find(product_id).price*amount
  end

  def total
    CartProduct.where(customer_id: current_customer).sum(subtotal)
  end
end
