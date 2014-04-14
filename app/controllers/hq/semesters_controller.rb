# encoding: UTF-8
class Hq::SemestersController < Hq::ApplicationController
  before_action :set_semester, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t('dock.semesters'), :hq_semesters_path
  def index
    @search = Semester.search(params[:q])
     @semesters = @search.result(:distinct => true).paginate(:page => params[:page])
     respond_with(@semesters)
  end

  def show
    add_breadcrumb @semester.name, hq_semester_path(@semester)
    respond_with(@semester)
  end

  def new
    add_breadcrumb t('tooltips.new'), new_hq_semester_path
    @semester = Semester.new
    respond_with(@semester)
  end

  def edit
    add_breadcrumb @semester.id, hq_semester_path(@semester)
    add_breadcrumb t('tooltips.edit'), edit_hq_semester_path
  end

  def create
    @semester = Semester.new(semester_params)
    @semester.save
    respond_with(:hq, @semester)
  end

  def update
    @semester.update(semester_params)
    respond_with(:hq, @semester)
  end

  def destroy
    @semester.destroy
    respond_with(:hq, @semester)
  end

  private

  def set_semester
    @semester = Semester.find(params[:id])
  end

  def semester_params
    params.require(:semester).permit(:name, :semester, :year)
  end
end
