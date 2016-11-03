class AddBoulderToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :boulder, :string
  end
end
