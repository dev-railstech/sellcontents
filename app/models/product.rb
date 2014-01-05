class Product < ActiveRecord::Base
  attr_accessible :code, :description, :name, :price, :user_id, :contents_attributes,
                  :image_attributes, :deleted_at
  has_one :image, :as => :viewable
  has_many :contents, :as => :viewable
  before_create :generate_code
  accepts_nested_attributes_for :contents, :image, :allow_destroy => true

  def self.active
    where(:deleted_at => nil)
  end

  private


  #Generates unique code
  def generate_code
    _array = ('a'..'z').to_a + ('A'..'Z').to_a
    sample = _array.sample(5).join
    while Asset.unscoped.where(:code => sample).present?
      sample = _array.sample(5).join
    end
    self.code = sample
  end


end
