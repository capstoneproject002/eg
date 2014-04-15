# encoding: UTF-8
class ClassRoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    @search = current_user.class_rooms.search(params[:q])
     @class_rooms = @search.result(:distinct => true).paginate(:page => params[:page])
     respond_with(@class_rooms)
  end

  def show
    @class_room = current_user.class_rooms.find(params[:id])
    @student = ClassRoomsUsers.where("user_id = ? AND class_room_id = ?", current_user.id, @class_room.id).first
    respond_with(@class_room)

  end

  private

  def set_class_room

  end

  def class_room_params
    params.require(:class_room).permit(:name, :semester_id, :teacher_id, :user_ids => [])
  end
end
