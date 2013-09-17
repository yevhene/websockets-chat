class MessagesController < ApplicationController

  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    @message.save
    redirect_to :back
  end

private

  def message_params
    params.require(:message).permit(:name, :text)
  end

end
