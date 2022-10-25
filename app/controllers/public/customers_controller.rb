class Public::CustomersController < ApplicationController

 before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def quite
    @current_customer = Customer.find_by(email: params[:email])
  end

  def update
    if current_customer.update(customer_params)
      redirect_to customer_path(current_customer), notice: "会員情報の編集が完了しました"
    else
     redirect_to edit_customer_path(current_customer)
    end
  end

  def out
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:lastname, :firstname, :kana_last_name, :kana_first_name, :postcode, :address, :email, :phone_number, :is_deleted)
  end

end

