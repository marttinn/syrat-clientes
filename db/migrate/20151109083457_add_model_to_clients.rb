class AddModelToClients < ActiveRecord::Migration
  def change
    add_column :clients, :car_model, :string
  end
end
