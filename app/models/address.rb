class Address < ApplicationRecord

  belongs_to :customer

  def address_display
    '〒' + post_code + ' ' + send_address + ' ' + send_name
  end
end
