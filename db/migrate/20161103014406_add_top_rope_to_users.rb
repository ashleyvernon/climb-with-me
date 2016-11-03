class AddTopRopeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :top_rope, :string
  end
end
