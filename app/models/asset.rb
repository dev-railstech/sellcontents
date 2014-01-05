class Asset < ActiveRecord::Base
  attr_accessible :attachment, :type, :viewable_id, :viewable_type
  belongs_to :viewable, :polymorphic => true
  belongs_to :order

  has_attached_file :attachment

  def self.for_sale
    where(:for_sale => true)
  end

  def clone_for(user, _order_id)
    _dup = self.dup
    _dup.viewable = user
    _dup.for_sale = false
    _dup.attachment = self.attachment
    _dup.order_id = _order_id
    _dup.save
  end


end
