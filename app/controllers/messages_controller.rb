class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(message_params)
    if message.save
      Rails.logger.debug "Broadcasting message: #{message.message}"
      ActionCable.server.broadcast("chatroom_channel", { message: render_message_partial(message) })     
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end

  def render_message_partial(message)
    MessagesController.render(
      partial: 'messages/message',
      locals: { message: message }
    )
  end
end