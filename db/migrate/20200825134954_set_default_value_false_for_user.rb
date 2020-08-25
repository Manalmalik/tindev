class SetDefaultValueFalseForUser < ActiveRecord::Migration[6.0]
  def change
        change_column_default :users, :online, from: true, to: false
  end
end
