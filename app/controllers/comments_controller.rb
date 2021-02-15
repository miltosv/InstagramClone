class CommentsController < ApplicationController
    def create
        #byebug
        @photo = Photo.find(params[:photo_id])
        #current_user = session[:user_id]
        @comment = @photo.comments.create(comment_params)
        #@comment = @photo.comments.build(comment_params)
        flash[:notice] = "Comment was successfully created."
        redirect_to user_path(session[:user_id])
        
    end

    def new
       @comment = Comment.new
       @users = User.all
    end

    def index
        @photo = Photo.find(params[:photo_id])
        #@user = User.find(params[:user_id])
        render(:partial => 'comments', :object => {:photo => @photo}) if request.xhr?
    end

    def show
    end

    private def comment_params
        params.require(:comment).permit(:user_id, :body) 
    end
end
