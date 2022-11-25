class ProfileMailer < ApplicationMailer
    default from: 'admin1@motainai.co.jp'

    def update_profile
        @user = params[:user]
        @url = "http://localhost:5000/profile/#{@user.profile.id}/edit" # Could I extract this base url into something like an env file?
        mail(to: @user.email, subject: 'Please update your profile')
    end
end
