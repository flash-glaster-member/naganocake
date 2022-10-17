class Public::CustomersController < ApplicationController
  before_action :authenticate_user!

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  def quite
  end

  def out
  end

  private

  def customer_params
    params.require(:customer).permit(:lastname, :firstname, :kana_lastname, :kana_firstname, :postcode, :address)
  end

end