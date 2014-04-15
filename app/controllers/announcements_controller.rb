# encoding: UTF-8
class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t('activerecord.models.announcements'), :announcements_path
  def index
    @search = Announcement.order('id DESC').search(params[:q])
    @announcements = @search.result(:distinct => true).paginate(:page => params[:page])
    respond_with(@announcements)
  end

  def show
    add_breadcrumb @announcement.title, announcement_path(@announcement)
    respond_with(@announcement)
  end

  private

  def set_announcement
    @announcement = Announcement.find(params[:id])
  end

  def announcement_params
    params.require(:announcement).permit(:content, :teacher, :title)
  end
end
