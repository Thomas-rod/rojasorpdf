class DonationMailer < ApplicationMailer

  # def donation_recip(donor, donation)
  #   @donor = donor # Instance variable => available in view
  #   @donation = donation
  #   mail(:subject => 'Merci pour votre don ! Voici votre reçu fiscal...', :to => @donor.email) do |format|
  #       format.text
  #       format.pdf do
  #         attachments["recu_fiscale_#{@donor.first_name}_#{@donor.last_name}_#{@donation.id}.pdf"] = WickedPdf.new.pdf_from_string(
  #           render_to_string(:pdf => "donation",:template => '../donations/show.pdf.erb')
  #         )
  #       end
  #     end

  #   # This will render a view in `app/views/user_mailer`!
  # end

  def send_recip(donation)
    @donation = Donation.find(donation.id)
    attachments["donation.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(:pdf => "donation",:template => "donations/show.html.erb", format: 'pdf')
    )
    mail(to: "rodiert17@gmail.com", subject: 'Your todo PDF is attached')
  end
end



# attachments["don_#{@donation.id}.pdf"] = WickedPdf.new.pdf_from_string(
#       render_to_string(pdf: 'donation', template: 'donations/show.html.erb', layout: 'pdf.html'), { :hash_with_wickedpdf_options }
#       )
#     mail(to: @donor.email, subject: 'Merci pour votre don ! Voici votre reçu fiscal...')
# todo = Todo.find(todo_id)
#     attachments["todo_#{todo.id}.pdf"] = WickedPdf.new.pdf_from_string(
#       render_to_string(pdf: 'todo', template: 'todo.pdf.erb', layout: 'pdf.html'), { :hash_with_wickedpdf_options }
#     )
#     mail(to: todo.owner.email, subject: 'Your todo PDF is attached', todo: todo)
