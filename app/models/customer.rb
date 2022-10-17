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
         

         has_many :cart_products
         has_many :orders
         has_many :addresses


end
