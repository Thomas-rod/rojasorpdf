class DonationsController < ApplicationController

  def index
    @donors = Donor.all
    @donations = Donation.all
  end

  def show
    @donation = Donation.find(params[:id])
  end

  def new
    @donation = Donation.new
  end

  def create
    @donor = Donor.find(params[:id])
    @donation = Donation.new(params_donation)
    @donation.user = @donor
    if @donation.save!
      redirect_to dashboard_donor_path(@donor)
    else
      render :new
    end
  end

  private

  def params_donation
    params.require(:donation).permit(:amount)
  end
end
