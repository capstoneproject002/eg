# encoding: UTF-8
class Hq::UsersController < Hq::ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  add_breadcrumb I18n.t('dock.users'), :hq_users_path

  def index
    @search = User.search(params[:q])
    @users = @search.result(:distinct => true).paginate(:page => params[:page])
  end

  def show
    add_breadcrumb @user.name, hq_user_path(@user)
    respond_with(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    respond_with(:hq, @user)
  end

  def edit

  end

  def update
    @user.update(user_params)
    respond_with(:hq, @user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
