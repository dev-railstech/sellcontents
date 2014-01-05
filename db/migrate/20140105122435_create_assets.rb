class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|

      t.string :name
      t.decimal :price, :precision => 8, :scale => 2
      t.string :code
      t.string :viewable_type
      t.integer :viewable_id
      t.attachment :attachment
      t.string :type
      t.boolean :for_sale

      t.timestamps
    end
  end
end
