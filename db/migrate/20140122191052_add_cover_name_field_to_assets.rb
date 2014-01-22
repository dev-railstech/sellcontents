class AddCoverNameFieldToAssets < ActiveRecord::Migration
  def change
    add_column :assets , :cover_name , :string
  end
end
