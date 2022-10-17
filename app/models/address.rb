class Address < ApplicationRecord

  belongs_to :customer

  def address_display
    '〒' + postal_code + ' ' + send_address + ' ' + send_name
  end
end
