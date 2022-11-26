# Preview all emails at http://localhost:5000/rails/mailers/profile

class ProfilePreview < ActionMailer::Preview
  def update_profile
    ProfileMailer.with(user: User.first).update_profile
  end
end
