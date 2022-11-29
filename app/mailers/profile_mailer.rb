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
    @user_name = get_profile_name(@user.profile)
    @url = @@base_url
    mail(to: @user.email, subject: 'Profile approved')
  end

  def approval_revoked
    @user = params[:user]
    @user_name = get_profile_name(@user.profile)
    @url = @@base_url
    mail(to: @user.email, subject: 'Approval revoked')
  end

  private 
# This method is shared with profile_controller - where can I define it so it is accessible to both controller and mailer?
  def get_profile_name(profile)
    "#{profile.first_name} #{profile.last_name}"
  end
end
