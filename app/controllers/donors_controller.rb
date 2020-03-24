class DonorsController < ApplicationController
  helper_method :sum_donations
  # CRUD

  def index
    @global_donation = global_donation
    @donors = Donor.all.order(last_name: 'ASC')
    @donations = Donation.all
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @donors = Donor.where("last_name ILIKE ? OR first_name ILIKE ? OR email ILIKE ?", "%#{@name}%","%#{@name}%","%#{@name}%").order(last_name: 'ASC')
    end
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

  def update
    @donor = Donor.find(params[:id])
    if @donor.update!(params_donors)
      redirect_to donor_path(@donor), notice: "Vos modifications ont bien été enregistrées"
    else
      render :new, notice: "Un problème lors de la modification est survenu"
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
