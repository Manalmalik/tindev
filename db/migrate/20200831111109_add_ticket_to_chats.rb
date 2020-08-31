class AddTicketToChats < ActiveRecord::Migration[6.0]
  def change
    add_reference :chats, :ticket
  end
end
