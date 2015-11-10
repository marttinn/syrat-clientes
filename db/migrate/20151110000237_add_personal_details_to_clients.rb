class AddPersonalDetailsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :email, :string
    add_column :clients, :telephone, :string
    add_column :clients, :serial, :string
  end
end
