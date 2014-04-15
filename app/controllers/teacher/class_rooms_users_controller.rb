# encoding: UTF-8
class Teacher::ClassRoomsUsersController < TeacherBaseController
  before_action :set_class_room_user, only: [:show, :edit, :update]
  before_action :teacher_control
  add_breadcrumb I18n.t('dock.class_rooms'), :teacher_class_rooms_path


  def edit

  end

  def update
    if @class_room_user.update(class_room_user_params)
      redirect_to [:teacher, @class_room_user.class_room]
    else
      render :edit
    end
  end

  def show
    add_breadcrumb @class_room.name, teacher_class_room_path(@class_room)
    respond_with(@class_room)
  end

  private

  def set_class_room_user
    @class_room_user = ClassRoomsUsers.find(params[:id])
  end

  def class_room_user_params
    params.require(:class_rooms_users).permit(:gpa, :score, :attendance)
  end

  def teacher_control
    unless @class_room_user.class_room.teacher_id == current_teacher.id
      flash[:alert] = 'Yetkisiz Erişim'
      redirect_to [:teacher, @class_room_user.class_room]
    end
  end
end
