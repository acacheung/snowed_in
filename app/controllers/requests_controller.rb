class RequestsController < ApplicationController

  def index
    if user_signed_in?
      @requests = Request.all
      @request = Request.new
    else
      redirect_to root_path, :notice => 'You are not authorized!'
    end
  end

  def create
    @request = Request.new(params[:request])
    @request.requester = current_user
    if @request.save
      redirect_to root_path, :notice => 'Your request has been posted'
    else
      render :action => 'new' # TODO validations need to be passed
    end
  end

  def new
    if current_user && current_user.requester?
      @request = Request.new
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

  def update
    @request = Request.find(params[:id])
    if current_user && current_user == @request.requester
      if @request.open?
        @request.matched(@request)
        @request.save
        redirect_to :back, :notice => 'Congrats on finding a shoveler!'
      elsif @request.matched?
        @request.completed(@request)
        @request.save
        redirect_to root_path, :notice => 'Request complete!'
      end
    end
    # if @request.should_expire?
    #   @request.expired(@request)
    #   @request.save
    #   redirect_to root_path, :notice =>
    # end
  end

  def destroy
    # NOT A REAL DESTROY!
    @request = Request.find(params[:id])
    if current_user && current_user == @request.requester
      @request.cancel(@request)
      @request.save
      redirect_to root_path, :notice => 'Your request has been cancelled'
    end
  end

end
