class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def current_ability
    if user_signed_in?
      @current_ability ||= Ability.new(current_user)
    end
  end

  def after_sign_in_path_for(resource)
    if resource.admin? #Assuming there is such a function
      admin_index_path
    else
      root_path
    end
  end

end
