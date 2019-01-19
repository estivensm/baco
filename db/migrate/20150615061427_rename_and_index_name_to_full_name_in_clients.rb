class RenameAndIndexNameToFullNameInClients < ActiveRecord::Migration
  def change
    rename_column :clients, :name, :full_name
    add_index :clients, :full_name
  end
end
