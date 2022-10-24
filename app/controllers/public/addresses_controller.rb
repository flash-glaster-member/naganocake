class Public::AddressesController < ApplicationController

  def index
    @customer = current_customer
    @addresses = Address.all
    @address = Address.new
  end

  def edit
    @customer = Customer.find(params[:id])
    @address = Address.new
  end

  def create
    @address = Address.new
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path(@address), notice: "配送先が新たに登録されました"
    else
     redirect_to addresses_path(current_customer)
     @addresses = Address.all
    end
  end

  def update
    if @address.update(address_params)
      redirect_to addresses_path(current_customer), notice: "配送先の編集が完了しました"
    else
      render "addresses/edit"
    end
  end

  def destroy
    @address.destroy
    flash[:notice] = "配送先の削除を実行いたしました"
    redirect_to address_path
  end

  private

  def address_params
    params.require(:address).permit(:post_code, :send_address, :send_name)
  end

end
