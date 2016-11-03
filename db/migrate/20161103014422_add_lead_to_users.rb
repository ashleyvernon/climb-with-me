class AddLeadToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :lead, :string
  end
end
