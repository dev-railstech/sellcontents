class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :total
      t.integer :product_id
      t.integer :seller_id
      t.integer :buyer_id
      t.string :stripe_card_token
      t.string :stripe_charge_id

      t.timestamps
    end
  end
end
