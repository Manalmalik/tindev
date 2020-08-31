class RemoveOnlineFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :online, :boolean
  end
end
