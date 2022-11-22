class ProfileController < ApplicationController
  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find_by(user_id: current_user.id)
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
end
