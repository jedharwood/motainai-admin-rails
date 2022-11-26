class RegistrationsController < Devise::RegistrationsController
    protected

    def after_sign_up_path_for(resource)
        @profile = Profile.find_by(user_id: resource.id)
        ProfileMailer.with(user: @profile.user).update_profile.deliver_later
        edit_profile_path(@profile)
    end
end
