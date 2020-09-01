class NotificationChannel < ApplicationCable::Channel
  def subscribed
    puts "subscribed to notifications"
    stream_from "notifications:#{current_user.id}"
  end

  def unsubscribed
    stop_all_streams
  end
end
