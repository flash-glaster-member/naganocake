class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to admin_customers_path(@customer), notice: "会員情報の編集に成功しました"
    else
      render "admin_customer_edit"
    end
  end

end
