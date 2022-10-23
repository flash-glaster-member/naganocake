class Public::CustomersController < ApplicationController

 before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def quite
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  def update
    if @customer.update(customer_params)
      redirect_to customer_path(@customer), notice: "会員情報の編集が完了しました"
    else
      render "edit/customer"
    end
  end

  def out
  end

  private

  def customer_params
    params.require(:customer).permit(:lastname, :firstname, :kana_lastname, :kana_firstname, :postcode, :address, :phone_number)
  end

end

