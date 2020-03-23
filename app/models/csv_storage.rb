class CsvStorage < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # CHECK FOR EVERY DONOR IF THEY ALREADY EXIST IN DB
      CsvStorage.create!(first_name: row['first_name'], last_name: row['last_name'], address: row['address'], zip_code: row['zip_code'], city: row['city'], email: row['email'], status: row['status'], amount: row['amount'], date: row['date'], platform: row['platform'], donation_number: row['donation_number'] )
    end
  end

end
