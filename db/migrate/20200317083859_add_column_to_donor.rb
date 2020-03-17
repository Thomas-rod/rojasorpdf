class AddColumnToDonor < ActiveRecord::Migration[6.0]
  def change
    add_column :donors, :status, :string
  end
end
