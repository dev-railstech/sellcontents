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


  def gravatar_url(ava_size = 100)
    default_url = "mm"
    gravatar_id = Digest::MD5.hexdigest(self.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}?s=#{ava_size}&d=#{CGI.escape(default_url)}"
  end


  def is_admin?
    self.role == 'admin'
  end
end
