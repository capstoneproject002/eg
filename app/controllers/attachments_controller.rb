# encoding: UTF-8
class AttachmentsController < ApplicationController
  before_action :set_attachment, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t('activerecord.models.attachments'), :attachments_path
  def index
    @search = current_user.attachments.search(params[:q])
     @attachments = @search.result(:distinct => true).paginate(:page => params[:page])
     respond_with(@attachments)
  end

  def show
    add_breadcrumb @attachment.user, attachment_path(@attachment)
    respond_with(@attachment)
  end

  def new
    add_breadcrumb t('tooltips.new'), new_attachment_path
    @attachment = Attachment.new
    respond_with(@attachment)
  end

  def edit
    add_breadcrumb @attachment.id, attachment_path(@attachment)
    add_breadcrumb t('tooltips.edit'), edit_attachment_path
  end

  def create
    @attachment = current_user.attachments.new(attachment_params)
    @attachment.save
    respond_with(@attachment)
  end

  def update
    @attachment.update(attachment_params)
    respond_with(@attachment)
  end

  def destroy
    @attachment.destroy
    respond_with(@attachment)
  end

  private

  def set_attachment
    @attachment = current_user.attachments.find(params[:id])
  end

  def attachment_params
    params.require(:attachment).permit(:class_room_id, :title, :file)
  end
end
