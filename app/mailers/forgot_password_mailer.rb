class ForgotPasswordMailer < ApplicationMailer
    def new_otp_email
        @otp = params[:otp]
        @to_user = params[:user]
        mail(to: params[:to_email], subject: "One Time Password for Password Reset" )
    end
end
