# frozen_string_literal: true

module UserProfileHelper
  def approved_user?(signed_in, profile)
    signed_in && profile&.approved
  end

  def user_profile_initials(signed_in, profile)
    signed_in && user_has_full_name(profile) ? "#{profile&.first_name&.[](0)}#{profile&.last_name&.[](0)}" : 'MA'
  end

  def user_profile_full_name(signed_in, profile)
    signed_in && user_has_full_name(profile) ? "#{profile&.first_name} #{profile&.last_name}" : ''
  end

  private

  def user_has_full_name(profile)
    profile&.first_name && profile&.last_name
  end
end
