class CommentsController < ApplicationController

  def create
    @request = Request.find(params[:request_id])
    if user_signed_in?
      @comment = @request.comments.new(params[:comment])
      @comment.user = current_user
      @comment.request = @request
    else
      redirect_to root_path, :notice => 'You are not authorized!'
    end

    if @comment.save
      redirect_to :back
    else
      redirect_to :back, :notice => 'Oops! Something went wrong. Try again.'
    end
  end

end
