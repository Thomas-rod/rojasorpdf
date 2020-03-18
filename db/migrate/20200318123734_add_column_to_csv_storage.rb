class AddColumnToCsvStorage < ActiveRecord::Migration[6.0]
  def change
    add_column :csv_storages, :date, :date
  end
end
