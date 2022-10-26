class Admin::OrderDetailsController < ApplicationController

  def index
  end

  def update

    @order_detail = OrderDetail.find(params[:id])
    @order = Order.find(@order_detail.order_id)
    if @order_detail.update(order_detail_params)
      redirect_to admin_order_path(@order)
    else
      render "order/index"
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end

end
