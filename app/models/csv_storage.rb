class CsvStorage < ApplicationRecord
  require 'csv'


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # CHECK FOR EVERY DONOR IF THEY ALREADY EXIST IN DB
      CsvStorage.create!(first_name: row['first_name'], last_name: row['last_name'], address: row['address'], zip_code: row['zip_code'], city: row['city'], email: row['email'], status: row['status'], amount: row['amount'], date: row['date'] )
    end
  end

  private

    # SHOULD BE IN self.import WILL SEE THIS LATER
    #   if Donor.find_by(email: row['email'])
    #   else
    #     donor_creation(row)
    #   end
    #   # CREATE DONATIONS
    #   donations_creation(row)
  def donor_creation(row)
  end

  # def donations_creation(row)
  #   Donation.create!(donor_id: Donor.last, amount: row['amount'])
  # end
end
