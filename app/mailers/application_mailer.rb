# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name('scribeofficial236@gmail.com', 'Scribe Official')
  layout 'mailer'
end
