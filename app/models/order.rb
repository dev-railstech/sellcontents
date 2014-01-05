class Order < ActiveRecord::Base
  attr_accessible :product_id, :buyer_id, :seller_id, :total, :stripe_card_token, :stripe_charge_id
  belongs_to :buyer, :class_name => "User"
  belongs_to :seller, :class_name => "User"
  belongs_to :product
  has_many :contents
  validates_presence_of :product_id

  before_create :set_total
  after_create :after_create_operations

  def save_with_payment
    if !valid?
      false
    elsif !(charge = create_stripe_charge)
      errors.add(:base, "There was a problem with your credit card.")
      false
    else
      update_attributes({
                            :stripe_charge_id => charge.id
                        })
    end
  end


  private

  def set_total
    self.seller_id = self.product.user_id
    self.total = self.product.price
  end

  def create_stripe_charge
    Stripe::Charge.create({
                              :amount => (self.total * 100).to_i,
                              :currency => 'usd',
                              :card => self.stripe_card_token,
                              :description => "Charge for #{self.title}",
                          })
  rescue Stripe::InvalidRequestError => e
    logger.error("Stripe error while creating charge: #{e.message}")
    nil
  end

  def after_create_operations
    clone_asset
    #send_new_order_mail
    #send_new_order_confirmation_mail
  end

  def clone_asset
    self.product.contents.each do |c|
      c.clone_for(self.buyer, self.id)
    end
  end
end
