class AddTypeFields < ActiveRecord::Migration
  def change
    add_column :products , :product_type , :string
    add_column :products , :free , :boolean
    add_column :products , :quantity , :integer
    add_column :products , :share_link, :string
    add_column :products , :shipping_option, :string
    add_column :products , :privacy_option, :string
  end
end
