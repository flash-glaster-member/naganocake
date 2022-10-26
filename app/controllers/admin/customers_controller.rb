class Admin::CustomersController < ApplicationController

  def index
     @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update!(customer_params)
      redirect_to admin_customer_path(@customer), notice: "会員情報の編集に成功しました"
    else
      render "admin_customer_edit"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:lastname, :firstname, :kana_last_name, :kana_first_name, :postcode, :address, :email, :phone_number, :is_deleted)
  end

end
