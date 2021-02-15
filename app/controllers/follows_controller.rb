class FollowsController < ApplicationController
  before_action :set_follow, only: [:show, :edit, :update, :destroy]

  # GET /follows
  def index
    @follows = Follow.all
  end

  # GET /follows/1
  def show
    @follows = Follow.all
  end

  # GET /follows/new
  def new
    @follow = Follow.new
  end


  # POST /follows
  def create
    @follow = current_user.follows.build(:followee_id =>params[:followee_id])

    if @follow.save
      redirect_to current_user, notice: 'Follow was successfully created.'
    else
      render :new
    end
    #redirect_to ('/users/'+(current_user.id).to_s)
  end

  def destroy
    byebug
    #@user = User.find(params[:user_id])
    #@follow = Follow.find(params[:id])
    #@follow.destroy
    @follow = current_user.follows.find(params[:id])
    @follow = Follow.find(params[:id])
    @follow.destroy
    flash[:notice] = "Unfollowed User"
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow
      @follow = Follow.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def follow_params
      params.require(:follow).permit(:user_id, :followee_id)
    end
end
