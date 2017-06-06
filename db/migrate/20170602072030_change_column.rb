class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :photos
    add_column :listings, :photos, :string
  end
end
