class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  def after_sign_in_path_for(resource)
    #if resource.admin
    #  admin_path
    #elsif resource.documentor
    #  documentor_path
    #else
    admin_role=Role.find_by_name("admin")
    author_role=Role.find_by_name("Author")

    if resource.roles.include?(admin_role)
      '/admin'
    elsif resource.roles.include?(author_role)
      '/author'
    else
      '/user'
    end
    #end

  end

end
