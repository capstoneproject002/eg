# encoding: UTF-8
class Teacher::ClassRoomsController < TeacherBaseController
  before_action :set_class_room, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t('dock.class_rooms'), :teacher_class_rooms_path
  def index
    @search = ClassRoom.search(params[:q])
     @class_rooms = @search.result(:distinct => true).paginate(:page => params[:page])
     respond_with(@class_rooms)
  end

  def show
    add_breadcrumb @class_room.name, teacher_class_room_path(@class_room)
    respond_with(@class_room)
  end

  private

  def set_class_room
    @class_room = ClassRoom.find(params[:id])
  end

  def class_room_params
    params.require(:class_room).permit(:name, :semester_id, :teacher_id, :user_ids => [])
  end
end
