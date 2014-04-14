require 'application_responder'

class TeacherBaseController < ActionController::Base
  add_breadcrumb 'Pano', :teacher_dashboard_index_path
  before_action :authenticate_teacher!
  self.responder = ApplicationResponder
  respond_to :html, :json
  layout 'teacher/application'
end