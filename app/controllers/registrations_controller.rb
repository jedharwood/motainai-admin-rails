class RegistrationsController < Devise::RegistrationsController
    protected

    def after_sign_up_path_for(resource)
        @profile = Profile.find_by(user_id: resource.id)
        edit_profile_path(@profile)
    end
end
