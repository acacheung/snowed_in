class PagesController < ApplicationController
  def welcome
    if user_signed_in?
      flash.keep
      redirect_to requests_path
    end
  end
end
