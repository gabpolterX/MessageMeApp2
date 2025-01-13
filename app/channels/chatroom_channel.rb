class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chatroom_channel"
    Rails.logger.debug "Streaming from chatroom_channel"
  end

  def speak(data)
    Rails.logger.debug "Received in speak: #{data}"
    ActionCable.server.broadcast("chatroom_channel", { message: data['message'] })
  end
end
