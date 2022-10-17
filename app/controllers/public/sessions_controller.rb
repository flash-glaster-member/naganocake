class Public::SessionsController < ApplicationController

before_action :customer_state, only: [:create]

protected
 def customer_state
  @customer = Customer.find_by(email: params[:customer][:email])
  return if !@customer
   if @customer.valid_password?(params[:customer][:password])&& (@user.is_deleted == false)
     flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
     redirect_to customers_show
   else
     flash[:notice] = "項目を入力してください"
   end
  end
 end

