class CreateDonors < ActiveRecord::Migration[6.0]
  def change
    create_table :donors do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :zip_code
      t.string :city
      t.string :email

      t.timestamps
    end
  end
end
