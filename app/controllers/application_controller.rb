require 'application_responder'

class ApplicationController < ActionController::Base
  before_filter :set_user_time_zone

  self.responder = ApplicationResponder
  respond_to :html, :json


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protected
  def set_user_time_zone
    Time.zone = current_user.time_zone if user_signed_in? && current_user.time_zone.present?
  end



  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super # Use the default one
    end
  end

  def after_sign_in_path_for(resource)
    if resource.class.name == 'User'
      super
    elsif resource.class.name == 'Admin'
      hq_dashboard_index_path
    elsif resource.class.name == 'Teacher'
      teacher_dashboard_index_path
    else
      super
    end
  end

end
