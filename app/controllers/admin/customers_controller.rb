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
    if @customer.update(customer_params)
      redirect_to admin_customers_path(@customer), notice: "会員情報の編集に成功しました"
    else
      render "admin_customer_edit"
    end
  end

end
