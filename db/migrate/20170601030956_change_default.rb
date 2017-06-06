class ChangeDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :users, :access_level, 0
  end
end
