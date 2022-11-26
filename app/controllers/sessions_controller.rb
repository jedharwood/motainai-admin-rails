class SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    @profile = Profile.find_by(user_id: resource.id)
    if user_has_full_name(@profile)
      root_path
    else
      edit_profile_path(@profile)
    end
  end

  private

  def user_has_full_name(profile)
    profile&.first_name && profile&.last_name
  end
end
