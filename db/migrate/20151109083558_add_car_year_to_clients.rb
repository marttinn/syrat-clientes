class AddCarYearToClients < ActiveRecord::Migration
  def change
    add_column :clients, :car_year, :string
  end
end
