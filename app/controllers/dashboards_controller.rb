class DashboardsController < ApplicationController

  def index
    @donations = Donation.all
    @donors = Donor.all
  end

end
