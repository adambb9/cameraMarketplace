class MessagesController < ApplicationController
  def index
    @messages = policy_scope(Message).between(current_user, params[:receiver_id])
  end

  def new
    @message = Message.new
    authorize @message
  end

  def create
    @message = Message.new(message_params)
    @message.sender = current_user
    @message.receiver = User.find(params[:receiver_id])
    authorize @message
    if @message.save
      redirect_to messages_path(receiver_id: @message.receiver.id)
    else
      render :new
    end
  end
end
