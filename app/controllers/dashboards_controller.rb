class DashboardsController < ApplicationController

  def index
    @url_excel_template = 'https://docs.google.com/spreadsheets/d/1DSshhF1E7ZHxSdynEImfxpzM0mMyaeMtqBHhFWIXWsM/edit?usp=sharing'
    @donations = Donation.all
    @donors = Donor.all
    @csv_storage = CsvStorage.new
    # raise
    if (Time.now - CsvStorage.last.created_at) > 10800
      CsvStorage.destroy_all
    end
    @csv_storages = CsvStorage.all
  end
end
