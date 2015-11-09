class AddUniqueIdToClients < ActiveRecord::Migration
  def change
    add_column :clients, :unique_repair_id, :string
  end
end
