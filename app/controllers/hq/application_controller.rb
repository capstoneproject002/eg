require 'application_responder'

class Hq::ApplicationController < ActionController::Base
  add_breadcrumb 'Pano', :hq_dashboard_index_path
  before_action :authenticate_admin!
  self.responder = ApplicationResponder
  respond_to :html, :json
end