class Order < ApplicationRecord

  has_many :order_details
  belongs_to :customer

  enum pay_way: {credit_card: 0, transfer: 1}
  enum status: {waiting: 0, confirm: 1, construction: 2, preparing: 3, sent: 4 }
  #{0: 入金待ち, 1:入金確認, 2: 製作中, 3: 発送準備中, 4: 発送済み}
  def address_display
    '〒' + post_code + ' ' + address + ' ' + name
  end

  def all_amount(id)
    order_details = OrderDetail.where(order_id: id)
    order_details.inject(0){|sum, order_detail| sum + order_detail.amount }
  end

  private
  def set_default_values
    self.pay_way  ||= 0
    self.status  ||= 0
  end

end
