# frozen_string_literal: true

class ProfileController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find_by(user_id: current_user&.id)
    respond_to do |format|
      format.html { render :edit, locals: { profile: @profile } }
    end
  end

  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html do
        if @profile.update(params.require(:profile).permit(:first_name, :last_name))
          flash[:success] = 'Profile updated successfully'
          redirect_to profile_path(@profile)
        else
          flash.now[:error] = 'Error: Profile could not be updated'
          render :edit, locals: { profile: @profile }, status: :unprocessable_entity
        end
      end
    end
  end

  def approve
    @profile = Profile.find_by(id: params[:id])
    @profile.approved = !@profile.approved
    if @profile.save
      flash[:success] =
        "#{get_profile_name(@profile)}'s #{get_success_message_text(@profile.approved)}. An email has been sent to #{@profile.user.email}"
      send_approval_mail(@profile)
    else
      flash[:error] = "Error: Could not update #{get_profile_name(@profile)}'s profile"
    end
    redirect_to user_index_path
  end

  private

  def get_profile_name(profile)
    "#{profile.first_name} #{profile.last_name}"
  end

  def get_success_message_text(approved)
    approved ? 'profile has been approved' : 'approval has been revoked'
  end

  def send_approval_mail(profile)
    profile.approved ? ProfileMailer.with(user: profile.user).profile_approved.deliver_later : ProfileMailer.with(user: profile.user).approval_revoked.deliver_later
  end
end
