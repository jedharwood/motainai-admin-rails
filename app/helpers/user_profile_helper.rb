module UserProfileHelper
    def is_approved_user
        user_signed_in? && current_user&.profile&.approved
    end

    def user_profile_initials   
        @profile = current_user&.profile
        user_signed_in? && user_has_full_name ? "#{@profile&.first_name[0]}#{@profile&.last_name[0]}" : 'MA'
    end

    def user_profile_full_name
        @profile = current_user&.profile
        user_signed_in? && user_has_full_name ? "#{@profile&.first_name} #{@profile&.last_name}" : ''
    end

    private

    def user_has_full_name
        @profile = current_user&.profile
        @profile&.first_name && @profile&.last_name
    end
end