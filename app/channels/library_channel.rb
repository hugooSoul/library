class LibraryChannel < ApplicationCable::Channel
  def subscribed
    stream_from "library_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    #ActionCable.server.broadcast 'library_channel', data['message']
    Message.create content: data['message']
  end
end
