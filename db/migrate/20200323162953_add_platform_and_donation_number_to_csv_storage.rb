class AddPlatformAndDonationNumberToCsvStorage < ActiveRecord::Migration[6.0]
  def change
    add_column :csv_storages, :platform, :string
    add_column :csv_storages, :donation_number, :integer
  end
end
