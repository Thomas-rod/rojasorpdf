class DashboardsController < ApplicationController

  def index
    @global_donation = global_donation
    @url_excel_template = 'https://docs.google.com/spreadsheets/d/1DSshhF1E7ZHxSdynEImfxpzM0mMyaeMtqBHhFWIXWsM/edit?usp=sharing'
    @donations = Donation.all
    @donors = Donor.all
    @csv_storage = CsvStorage.new
    unless CsvStorage.all.count == 0
      if (Time.now - CsvStorage.last.created_at) > 10800
        CsvStorage.destroy_all
      end
    end
    @csv_storages = CsvStorage.all.order(last_name: 'ASC')

  end
end
