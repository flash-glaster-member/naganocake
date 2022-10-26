class Address < ApplicationRecord

  belongs_to :customer

  validates :post_code, length: { is: 7 }

  def address_display
    '〒' + post_code + ' ' + send_address + ' ' + send_name
  end
end
