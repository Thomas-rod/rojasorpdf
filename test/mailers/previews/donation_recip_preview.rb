class DonationMailerPreview < ActionMailer::Preview

  def donation_recip
    donor = Donor.find_by(email: 'rodiert17@gmail.com')
    # This is how you pass value to params[:user] inside mailer definition!
    DonationMailer.with(donor: donor).donation_recip
  end
end
