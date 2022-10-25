class Public::ProductsController < ApplicationController

  def index
    @products = Product.all.order("id DESC")
  end

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :product_image, :genre_id, :price, :is_active)
  end

end
