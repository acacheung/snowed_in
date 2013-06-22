class PagesController < ApplicationController
  def welcome
    @requests = Request.all
    @request = Request.new
  end
end
