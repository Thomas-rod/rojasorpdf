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
    CsvStorage.all.each do |donation|
      donation_email = donation.email
      if Donor.find_by(email: donation_email)
        Donation.create!(donor: Donor.find_by(email: donation_email), amount: donation.amount, date: donation.date)
      else
        Donor.create!(first_name: donation.first_name, last_name: donation.last_name, address: donation.address, zip_code: donation.zip_code, city: donation.city, email: donation.email, status: donation.status)
        Donation.create!(donor: Donor.last, amount: donation.amount, date: donation.date)
      end
    end
  end

end
