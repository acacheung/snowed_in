class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
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
end
