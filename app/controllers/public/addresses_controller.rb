class Public::AddressesController < ApplicationControlle
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @customer = Customer.find(params[:id])
    @addresses = @customer.addresses
    @address = Address.new
  end

  def edit
    @customer = Customer.find(params[:id])
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.user_id = current_user.id
    if @address.save
      redirect_to addresses_path(@address), notice: "配送先が新たに登録されました"
    else
      @customer = Customer.find(params[:id])
      @addresses = @customer.addresses
      render 'address/index'
    end
  end

  def update
    if @address.update(address_params)
      redirect_to addresses_path(@address), notice: "配送先の編集が完了しました"
    else
      render "address/edit"
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
