class Public::CartProductsController < ApplicationController

  def index
    @cart_products = CartProduct.all
  end

  def update
  end

  def destroy
  end

  def all_destroy
  end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.customer_id = current_customer.id
    #product = Product.find(params[:product_id])
    #@cart_product.product_id = product.id
    if @cart_product.save!
      redirect_to products_path
    else
      redirect_to product_path(@cart_product.product_id)
    end
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:amount,:product_id,:customer_id)

  end

end
