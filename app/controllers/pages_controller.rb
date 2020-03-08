class PagesController < ApplicationController
  def index
    if logged_in?
      redirect_to about_path
    end
  end
  
  def about
    set_info
  end
end
