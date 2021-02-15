class PhotosController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    if params[:photo] == nil

      flash[:alert] = "Please upload a photo"
      redirect_to :back
    else
    @photo = Photo.create(photo_params)
      @photo.user_id = @user.id
      @photo.save
      flash[:notice] = "Successfully uploaded a photo"
      redirect_to user_path(session[:user_id])
      
    end
  end

  def photos_of_follows
    @photos.of_followees
  end


  def new
    @user = User.find(params[:user_id])
    @photo = Photo.create()
  end

  def destroy
    @user = User.find(params[:user_id])
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = 'Your photo has been deleted'
    redirect_to :back
  end

  private
  def photo_params
    params.require(:photo).permit(:title, :image)
  end
end
