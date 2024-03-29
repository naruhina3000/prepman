class ApplicationController < ActionController::Base
  before_action :store_user_location!, if: :storable_location?
  before_action :authenticate_user!

  # before_action :configure_permitted_parameters, if: :devise_controller?

  # def configure_permitted_parameters
  #   # For additional fields in app/views/devise/registrations/new.html.erb
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :photo])

  #   # For additional in app/views/devise/registrations/edit.html.erb
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :photo])
  # end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || request.referrer
  end

  # def after_sign_up_path_for
  #   @user = current_user
  #   redirect_to user_path(@user)
  # end



  private
  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end


end
