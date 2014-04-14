# encoding: UTF-8
class Teacher::UsersController < TeacherBaseController
  before_action :set_user, only: [:show, :edit, :update]
  add_breadcrumb I18n.t('dock.users'), :teacher_users_path

  def index
    @search = User.search(params[:q])
    @users = @search.result(:distinct => true).paginate(:page => params[:page])
  end

  def show
    add_breadcrumb @user.name, teacher_user_path(@user)
    respond_with(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
