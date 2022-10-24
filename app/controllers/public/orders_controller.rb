class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def log

    #binding.pry

    @order = Order.new(order_params)

    if params[:order][:address_number] == "0"
      @order.name = current_customer.customer_name
      @order.address = current_customer.address
      @order.post_code = current_customer.postcode
    elsif params[:order][:address_number] == "1"
        @order.name = Address.find(params[:order][:registered]).send_name
        @order.address = Address.find(params[:order][:registered]).send_address
        @order.post_code = Address.find(params[:order][:registered]).post_code
    elsif params[:order][:address_number] == "2"
      address_new = current_customer.addresses.new(address_params)
      if address_new.save
      else
        render new
      end
    else
    end
    @cart_products = current_customer.cart_products.all
    @total = @cart_products.inject(0){|sum, product| sum + product.subtotal }
  end

  def create
    #binding.pry
    cart_products = current_customer.cart_products.all
    @order = current_customer.orders.new(order_params)
    if @order.save
      cart_products.each do |cart|
        order_detail = OrderDetail.new
        order_detail.product_id = cart.product_id
        order_detail.order_id = @order.id
        order_detail.amount = cart.amount
        order_detail.product_price = Product.find(cart.product_id).price
        order_detail.save
      end
      redirect_to orders_thanks_path
      cart_products.destroy_all

    else
      @order = Order.new(order_params)
      render new
    end
  end

  def index
    @customer = current_customer
    @orders = @customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def thanx
  end

  private

  def order_params
     params.require(:order).permit(:post_code,:product_id,:customer_id,:address,:name,:total_price,:pay_way,:status,:postage)
  end

  def address_params
    params.require(:order).permit(:send_name,:send_address,:post_code)
  end

end
