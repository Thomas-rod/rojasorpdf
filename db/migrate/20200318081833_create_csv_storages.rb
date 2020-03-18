class CreateCsvStorages < ActiveRecord::Migration[6.0]
  def change
    create_table :csv_storages do |t|

      t.timestamps
    end
  end
end
