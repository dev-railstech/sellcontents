class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password,
                  :password_confirmation, :remember_me, :firstname, :lastname
  has_many :assets, :as => :viewable
  has_many :products
  has_many :sold_orders, :foreign_key => :seller_id, :class_name => "Order"
  has_many :bought_orders, :foreign_key => :buyer_id, :class_name => "Order"


  def is_admin?
    self.role == 'admin'
  end
end
