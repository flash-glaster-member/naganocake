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
  end

  private

end
