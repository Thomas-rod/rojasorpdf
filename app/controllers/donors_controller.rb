class DonorsController < ApplicationController
  helper_method :sum_donations
  # CRUD

  def index
    @donors = Donor.all
  end

  def show
    @donor = Donor.find(params[:id])
    @amount = 0
    @donor.donations.each do |donation|
      @amount =+ donation.amount
    end
  end

  def new
    @donor = Donor.new
  end

  def create
    @donor = Donor.new(params_donors)
    if @donor.save!
      redirect_to donors_path
    else
      render :new
    end
  end

  # OTHER METHODS
  def sum_donations(donor)
    sum_donation = 0
    donor.donations.each do |donation|
      sum_donation += donation.amount
    end
    return sum_donation
  end

  private

  def params_donors
    params.require(:donor).permit(:first_name,:last_name,:address,:zip_code, :city, :email, :status)
  end

end
