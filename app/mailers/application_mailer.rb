class ApplicationMailer < ActionMailer::Base
  default from: 'rojasorfrance@gmail.com', cc: 'rojasorfrance@gmail.com'
  layout 'mailer'
end
