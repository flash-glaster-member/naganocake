# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :authenticate_customer!
  before_action :customer_state, only: [:create]


  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

   def after_sign_in_path_for(resource)
        # admin_order_details_path(resource)
        root_path
   end

   def after_sign_out_path_for(resource)
       new_customer_session_path
   end

   def customer_state
    @customer = Customer.find_by(email: params[:email])
    return if !@customer
     if @customer.valid_password?(params[:password])&& (@customer.is_deleted == true)
       flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
       redirect_to "/"
     else
       flash[:notice] = "項目を入力してください"
     end
   end
end

