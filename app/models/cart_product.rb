class CartProduct < ApplicationRecord

  has_many :products
  belongs_to :customer

end
