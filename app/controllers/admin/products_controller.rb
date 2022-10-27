class Admin::ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page])
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
    if params[:product_image] == nil
      if @product.update(product_params_no_image)
        redirect_to admin_products_path,  notice: "変更を保存しました"
      else
        render "edit"
      end
    else
      if @product.update(product_params)
         redirect_to admin_products_path,  notice: "変更を保存しました"
      else
         render "edit"
      end
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :product_image, :genre_id, :price, :is_active)
  end
  def product_params_no_image
    params.require(:product).permit(:name, :description, :genre_id, :price, :is_active)
  end

end
