# frozen_string_literal: true

class ProfileMailer < ApplicationMailer
  default from: 'admin1@motainai.co.jp'

  def update_profile
    @user = params[:user]
    # Could I extract this base url into something like an env file?
    @url = "http://localhost:5000/profile/#{@user.profile.id}/edit"
    mail(to: @user.email, subject: 'Please update your profile')
  end
end
