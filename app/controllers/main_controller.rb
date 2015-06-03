class MainController < ApplicationController
  skip_before_action :authenticate_user!
  
  def index
    if user_signed_in?
      redirect_to current_user
    end
  end

  def about
  end

  def contact
  end
end
