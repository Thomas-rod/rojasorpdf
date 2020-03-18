class AddColumnsToCsvStorage < ActiveRecord::Migration[6.0]
  def change
    add_column :csv_storages, :first_name, :string
    add_column :csv_storages, :last_name, :string
    add_column :csv_storages, :address, :string
    add_column :csv_storages, :zip_code, :integer
    add_column :csv_storages, :city, :string
    add_column :csv_storages, :email, :string
    add_column :csv_storages, :status, :string
    add_column :csv_storages, :amount, :float
  end
end
