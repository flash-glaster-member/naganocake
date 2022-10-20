class Public::CustomersController < ApplicationController

 before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def quite
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def out
  end

  private

  def customer_params
    params.require(:customer).permit(:lastname, :firstname, :kana_lastname, :kana_firstname, :postcode, :address)
  end

end

