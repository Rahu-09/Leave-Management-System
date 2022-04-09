class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :is_active, :boolean
    add_column :users, :emp_id, :string
  end
end
