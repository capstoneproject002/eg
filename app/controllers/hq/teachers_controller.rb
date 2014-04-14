# encoding: UTF-8
class Hq::TeachersController < Hq::ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update]
  add_breadcrumb I18n.t('dock.teachers'), :hq_teachers_path

  def index
    @search = Teacher.search(params[:q])
    @teachers = @search.result(:distinct => true).paginate(:page => params[:page])
  end

  def show
    add_breadcrumb @teacher.name, hq_teacher_path(@teacher)
    respond_with(@teacher)
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.save
    respond_with(:hq, @teacher)
  end

  def edit

  end

  def update
    @teacher.update(teacher_params)
    respond_with(:hq, @teacher)
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:email, :name)
  end
end
