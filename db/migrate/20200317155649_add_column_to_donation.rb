class AddColumnToDonation < ActiveRecord::Migration[6.0]
  def change
    add_column :donations, :fiscal_recip, :boolean, default: false
  end
end
