class OrderDetail < ApplicationRecord

  belongs_to :product
  belongs_to :order
  
  

  enum production_status: {cannot: 0, waiting: 1, maiking: 2, completed: 3,}

  def subtotal
    Product.find(product_id).price*amount
  end

  private
  def set_default_values
    self.product_starus  ||= 0
  end

end
