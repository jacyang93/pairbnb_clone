class AddReferenceListingPhoto < ActiveRecord::Migration[5.0]
  def change
    add_reference :photos, :listing, foreign_key: true, index: true
  end
end
