class AddColumnToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :max_guest, :integer
    add_column :listings, :price, :integer
  end
end
