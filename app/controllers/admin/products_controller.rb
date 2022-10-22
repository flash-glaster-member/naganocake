class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all
    @genres = Genre.all
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
    @product = Product.find(params[:id])
    @genres = Genre.all
  end

  def edit
    @product = Product.find(params[:id])
    @genres = Genre.all
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path,  notice: "変更を保存しました"
    else
      render "edit"
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :product_image, :genre_id, :price, :is_active)
  end

end
