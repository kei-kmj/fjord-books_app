class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :post_code, :string
    add_column :users, :address, :string
    add_column :users, :about_me, :text

  end
end
