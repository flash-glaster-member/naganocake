class Public::CartProductsController < ApplicationController

  def index
    @cart_products = CartProduct.where(customer_id: current_customer)
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    if @cart_product.update(cart_product_params)
      redirect_to cart_products_path
    else

    end
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    if @cart_product.destroy
      redirect_to cart_products_path
    else

    end
  end

  def all_destroy
    @cart_products = CartProduct.where(customer_id: current_customer)
    @cart_products.destroy
  end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_product.customer_id = current_customer.id
    if @cart_product.save
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
