# encoding: UTF-8
class Teacher::AnnouncementsController < TeacherBaseController
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t('dock.announcements'), :teacher_announcements_path
  def index
    @search = current_teacher.announcements.search(params[:q])
     @announcements = @search.result(:distinct => true).paginate(:page => params[:page])
     respond_with(@announcements)
  end

  def show
    add_breadcrumb @announcement.title, teacher_announcement_path(@announcement)
    respond_with(@announcement)
  end

  def new
    add_breadcrumb t('tooltips.new'), new_teacher_announcement_path
    @announcement = current_teacher.announcements.new
    respond_with(@announcement)
  end

  def edit
    add_breadcrumb @announcement.id, teacher_announcement_path(@announcement)
    add_breadcrumb t('tooltips.edit'), edit_teacher_announcement_path
  end

  def create
    @announcement = current_teacher.announcements.new(announcement_params)
    @announcement.save
    respond_with(:teacher, @announcement)
  end

  def update
    @announcement.update(announcement_params)
    respond_with(:teacher, @announcement)
  end

  def destroy
    @announcement.destroy
    respond_with(:teacher, @announcement)
  end

  private

  def set_announcement
    @announcement = current_teacher.announcements.find(params[:id])
  end

  def announcement_params
    params.require(:announcement).permit(:content, :title)
  end
end
