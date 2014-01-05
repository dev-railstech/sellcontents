class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :code
      t.decimal :price
      t.integer :user_id
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
