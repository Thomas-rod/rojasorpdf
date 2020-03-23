class DonationMailer < ApplicationMailer

  def send_recip(donation)
    @donation = Donation.find(donation.id)
    attachments["Reçu fiscal No. #{@donation.id} - #{@donation.donor.first_name} #{@donation.donor.last_name}.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(:pdf => "donation",:template => "donations/show.html.erb", :format => 'pdf')
    )
    mail(to: "#{@donation.donor.email}", subject: 'Votre reçu fiscal !')
  end
end
