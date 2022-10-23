class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def log
  end

  def create
  end

  def index
    @customer = current_customer
    @orders = @customer.orders
  end

  def show
    @oder = Order.find(params[:id])
  end

  def thanx
  end
end
