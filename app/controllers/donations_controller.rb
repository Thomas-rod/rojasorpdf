class DonationsController < ApplicationController
  helper_method :fiscal_recip_send

  def index
    @donors = Donor.all
    @donations = Donation.all.order(date: 'DESC')
  end

  def show
    @donation = Donation.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Reçu fiscal No. #{@donation.id} - #{@donation.donor.first_name} #{@donation.donor.last_name}",
          layout: 'pdf.html',
          page_size: 'A4',
          template: "donations/show.html.erb",
          lowquality: true,
          zoom: 1,
          dpi: 300,
          encoding:"UTF-8"
      end
    end
  end

  def new
    @donation = Donation.new
  end

  def create
    @donor = Donor.find(params[:id])
    @donation = Donation.new(params_donation)
    @donation.donor = @donor
    if @donation.save!
      redirect_to dashboard_donor_path(@donor)
    else
      render :new
    end
  end

  def update
    @donation = Donation.find(params[:id])
    @donor = @donation.donor
    DonationMailer.send_recip(@donation).deliver_now
    @donation.fiscal_recip = true
    @donation.save!
    redirect_to donor_path(@donor), notice: 'Le mail a bien été envoyé'
  end

  private

  def params_donation
    params.require(:donation).permit(:amount, :date)
  end
end
