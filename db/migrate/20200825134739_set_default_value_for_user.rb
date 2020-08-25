class SetDefaultValueForUser < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :online, to: false
  end
end
