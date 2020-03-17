class DashboardsController < ApplicationController

  def index
    @url_excel_template = 'https://docs.google.com/spreadsheets/d/1DSshhF1E7ZHxSdynEImfxpzM0mMyaeMtqBHhFWIXWsM/edit?usp=sharing'
    @donations = Donation.all
    @donors = Donor.all
  end

end
