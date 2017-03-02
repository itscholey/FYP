class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      render 'show'
    else
      render 'new'
    end
  end

  def index
    #@messages = Message.find(conditions: ["conversation_id = ?", params[:conversation]])
    @messages = Message.all
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

end
