class WelcomeController < ApplicationController

  #skip_before_filter :authenticate_user!  , :only => [:index]

  def index
  end

  def user_view
    u=User.find(1);
    sign_in(:user,u)
  end

  def doclauncher
    if params[:id]
      @document=Document.find(params[:id])
    end
  end

end
