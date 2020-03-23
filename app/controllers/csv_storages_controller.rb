class CsvStoragesController < ApplicationController

  def index
    @csv_storages = CsvStorage.all.order(date: 'ASC')
  end

  def import
    # CsvStorage.destroy_all
    CsvStorage.import(params[:csv_storage][:file].tempfile)
    donors_analysis
    redirect_to dashboards_path, notice: 'Le fichier a bien été importé'
  end

  private

  def donors_analysis
    CsvStorage.all.each do |donation|
      if Donor.find_by(email: donation.email)
        if donation_analysis(donation)

        else
          Donation.create!(donor: Donor.find_by(email: donation.email), amount: donation.amount, date: donation.date, platform: donation.platform, donation_number: donation.donation_number)
        end
      else
        Donor.create!(first_name: donation.first_name, last_name: donation.last_name, address: donation.address, zip_code: donation.zip_code, city: donation.city, email: donation.email, status: donation.status)
        Donation.create!(donor: Donor.find_by(email: donation.email), amount: donation.amount, date: donation.date, platform: donation.platform, donation_number: donation.donation_number)
      end
    end
  end

  private

  def donation_analysis(donation)
    Donation.find_by(platform: donation.platform, donation_number: donation.donation_number)
  end


end
