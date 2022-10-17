class Order < ApplicationRecord

  has_many :order_details
  belongs_to :customer

  enum pay_way: {cledit_card: 0, transfer: 1}

end
