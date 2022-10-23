class Public::AddressesController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @customer = current_customer
    @addresses = @customer.addresses
    @address = Address.new
  end

  def edit
    @customer = Customer.find(params[:id])
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path(@address), notice: "配送先が新たに登録されました"
    else
      @customer = current_customer
      @addresses = @customer.addresses
      render "public/addresses/index"
    end
  end

  def update
    if @address.update(address_params)
      redirect_to addresses_path(@address), notice: "配送先の編集が完了しました"
    else
      render "addresses/edit"
    end
  end

  def destroy
    @customer.destroy
    redirect_to address_index_path
  end

  private

  def address_params
    params.require(:address).permit(:post_code, :address, :phone_number)
  end

end
