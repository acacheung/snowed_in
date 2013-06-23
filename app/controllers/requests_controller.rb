class RequestsController < ApplicationController

  def index
    if current_user && current_user.shoveler?
      @requests = Request.all
    else
      redirect_to root_path, :notice => 'You are not authorized!'
    end
  end

  def show
    if user_signed_in?
      @request = Request.find(params[:id])
    else
      redirect_to root_path, :notice => 'You are not authorized!'
    end
  end

  def new
    if current_user && current_user.requester?
      @request = Request.new
    else
      redirect_to root_path, :notice => 'You are not authorized!'
    end
  end

  def create
    @request = Request.new(params[:request])
    @request.requester = current_user
    if @request.save
      redirect_to @request, :notice => 'Request was successfully created'
    else
      render :action => 'new'
    end
  end

  def destroy
    @request = Request.find(params[:id])
    if current_user && current_user == @request.requester
      @request.destroy
      redirect_to root_path, :notice => 'Your request has been cancelled'
    end
  end

end
