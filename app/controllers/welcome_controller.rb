class WelcomeController < ApplicationController

  skip_before_filter :authenticate_user!  , :only => [:index]

  def index
  end

  def user_view
  end

  def doclauncher
    if params[:id]
      @document=Document.find(params[:id])
    end
  end

end
