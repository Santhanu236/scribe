# Preview all emails at http://localhost:3000/rails/mailers/forgot_password_mailer
class ForgotPasswordMailerPreview < ActionMailer::Preview
    def new_otp_email
        @msg = params[:msg]
        mail(to: "santhanu236@gmail.com", subject: "success da" )
    end
end
    