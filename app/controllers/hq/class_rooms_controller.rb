# encoding: UTF-8
class Hq::ClassRoomsController < Hq::ApplicationController
  before_action :set_class_room, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t('dock.class_rooms'), :hq_class_rooms_path
  def index
    @search = ClassRoom.search(params[:q])
     @class_rooms = @search.result(:distinct => true).paginate(:page => params[:page])
     respond_with(@class_rooms)
  end

  def show
    add_breadcrumb @class_room.name, hq_class_room_path(@class_room)
    respond_with(@class_room)
  end

  def new
    add_breadcrumb t('tooltips.new'), new_hq_class_room_path
    @class_room = ClassRoom.new
    respond_with(@class_room)
  end

  def edit
    add_breadcrumb @class_room.id, hq_class_room_path(@class_room)
    add_breadcrumb t('tooltips.edit'), edit_hq_class_room_path
  end

  def create
    @class_room = ClassRoom.new(class_room_params)
    @class_room.save
    respond_with(:hq, @class_room)
  end

  def update
    @class_room.update(class_room_params)
    respond_with(:hq, @class_room)
  end

  def destroy
    @class_room.destroy
    respond_with(:hq, @class_room)
  end

  private

  def set_class_room
    @class_room = ClassRoom.find(params[:id])
  end

  def class_room_params
    params.require(:class_room).permit(:name, :semester_id, :teacher_id, :user_ids => [])
  end
end
