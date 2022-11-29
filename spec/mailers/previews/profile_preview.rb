# frozen_string_literal: true

# Preview all emails at http://localhost:5000/rails/mailers/profile

class ProfilePreview < ActionMailer::Preview
  def update_profile
    ProfileMailer.with(user: User.first).update_profile
  end

  def profile_approved
    ProfileMailer.with(user: User.first).profile_approved
  end

  def approval_revoked
    ProfileMailer.with(user: User.first).approval_revoked
  end
end
