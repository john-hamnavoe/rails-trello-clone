class ListsChannel < ApplicationCable::Channel
  def subscribed
    stop_all_streams
    stream_for Board.find_by(id: params["id"])
    # stream_from "some_channel"
  end

  def unsubscribed
    stop_all_streams
    # Any cleanup needed when channel is unsubscribed
  end
end
