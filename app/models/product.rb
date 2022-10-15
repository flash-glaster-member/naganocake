class Product < ApplicationRecord
  has_many :carts
  has_many :order_details
  belongs_to :genre
end
