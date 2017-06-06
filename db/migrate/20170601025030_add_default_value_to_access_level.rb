class AddDefaultValueToAccessLevel < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :access_level, :integer, default: 0
  end
end
