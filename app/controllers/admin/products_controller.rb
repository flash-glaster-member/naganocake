class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :product_image, :genre_id, :price, :is_active)
  end

end
