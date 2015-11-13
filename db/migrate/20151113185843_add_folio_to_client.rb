class AddFolioToClient < ActiveRecord::Migration
  def change
    add_column :clients, :folio, :string
  end
end
