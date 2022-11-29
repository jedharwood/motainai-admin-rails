# frozen_string_literal: true

class ProfileMailer < ApplicationMailer
  default from: 'admin1@motainai.co.jp'
  @@base_url = 'http://localhost:5000'
  # Could I extract this base url into something like an env file?

  def update_profile
    @user = params[:user]
    @url = "#{@@base_url}/profile/#{@user.profile.id}/edit"
    mail(to: @user.email, subject: 'Please update your profile')
  end

  def profile_approved
    @user = params[:user]
    @user_name = "#{@user.profile.first_name} #{@user.profile.last_name}"
    @url = @@base_url
    mail(to: @user.email, subject: 'Profile approved')
  end
end
