class AddColumnsToDonation < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :platform, :string
    add_column :donations, :donation_number, :integer
  end
end
