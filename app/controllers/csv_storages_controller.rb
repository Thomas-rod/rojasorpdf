class CsvStoragesController < ApplicationController

  def index
    @csv_storages = CsvStorage.all.order(date: 'ASC')
  end

  def import
    CsvStorage.destroy_all
    CsvStorage.import(params[:csv_storage][:file].tempfile)
    donors_analysis
    redirect_to dashboards_path, notice: 'Le fichier a bien été importé'
  end

  private

  def donors_analysis
    @rows = CsvStorage.where(created_at: (Time.now - 60)..Time.now)
    @rows.each do |row|
      if Donor.find_by(email: row.email)
        if row_analysis(row)
          row.update!(import_status: false)
        else
          row.update!(import_status: true)
          Donation.create!(donor: Donor.find_by(email: row.email), amount: row.amount, date: row.date, platform: row.platform, donation_number: row.donation_number)
        end
      else
        Donor.create!(first_name: row.first_name, last_name: row.last_name, address: row.address, zip_code: row.zip_code, city: row.city, email: row.email, status: row.status)
        row.update!(import_status: true)
        Donation.create!(donor: Donor.find_by(email: row.email), amount: row.amount, date: row.date, platform: row.platform, donation_number: row.donation_number)
      end
    end
  end

  private

  def row_analysis(row)
    Donation.find_by(platform: row.platform, donation_number: row.donation_number)
  end


end
