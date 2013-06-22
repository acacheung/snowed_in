class PagesController < ApplicationController
  def welcome
    @requests = Request.all
  end
end
