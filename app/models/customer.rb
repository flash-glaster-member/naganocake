class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :firstname, presence: true
         validates :lastname, presence: true
         validates :kana_firstname, presence: true
         validates :kana_lastname, presence: true
         validates :postcode, presence: true
         validates :address, presence: true
         validates :email, presence: true
         validates :password, presence: true


  has_many :cart_products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy

  def active_for_authentication?
    super && (is_deleted == false)
  end
end
