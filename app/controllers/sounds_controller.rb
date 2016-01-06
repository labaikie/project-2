class SoundsController < ApplicationController

  before_action :current_user, only: [:create, :destroy, :update]

  def create
    @sound = current_user.sounds.build(sound_params)
    if @sound.save
      flash[:success] = "You have voiced!"
      redirect_to :back
    else
      flash[:error] = "Saving voice was unsuccessful"
    end
  end

  def destroy
    @sound = Sound.find(params[:id])
    if @sound.user == current_user
      @sound.destroy
      redirect_to :back
    end
  end

  def update
    @sound = Sound.find(params[:id])
    if @sound.user == current_user && @sound.update_attributes(sound_params)
      redirect_to user_path(@sound.user)
    else
      flash[:error] = "updating voice was unsuccessful"
    end
  end

  private

  def sound_params
    params.require(:sound).permit(
      :type,
      :sound_url
    )
  end

end
