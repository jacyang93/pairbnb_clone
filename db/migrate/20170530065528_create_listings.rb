class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.references :user, foreign_key: true
      t.string :description
      t.string :address
      t.integer :number_of_rooms

      t.timestamps
    end
  end
end
