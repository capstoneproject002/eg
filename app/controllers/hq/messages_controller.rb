# encoding: UTF-8
class Hq::MessagesController < Hq::ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  add_breadcrumb I18n.t('dock.messages'), :hq_messages_path
  def index
    @search = Message.search(params[:q])
     @messages = @search.result(:distinct => true).paginate(:page => params[:page])
     respond_with(@messages)
  end

  def show
    add_breadcrumb @message.title, hq_message_path(@message)
    respond_with(@message)
  end

  def new
    add_breadcrumb t('tooltips.new'), new_hq_message_path
    @message = Message.new
    respond_with(@message)
  end

  def edit
    add_breadcrumb @message.id, hq_message_path(@message)
    add_breadcrumb t('tooltips.edit'), edit_hq_message_path
  end

  def create
    @message = Message.new(message_params)
    @message.save
    respond_with(:hq, @message)
  end

  def update
    @message.update(message_params)
    respond_with(:hq, @message)
  end

  def destroy
    @message.destroy
    respond_with(:hq, @message)
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content, :title, :receiver)
  end
end
