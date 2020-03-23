class AddImportStatusToCsvStorage < ActiveRecord::Migration[6.0]
  def change
    add_column :csv_storages, :import_status, :boolean
  end
end
