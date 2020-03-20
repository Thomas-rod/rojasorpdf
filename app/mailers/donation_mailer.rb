class DonationMailer < ApplicationMailer

  def donation_recip(donor)
    @donor = donor # Instance variable => available in view
    mail(to: @donor.email, subject: 'Merci pour votre don ! Voici votre reçu fiscal...')
    # This will render a view in `app/views/user_mailer`!
  end
end
