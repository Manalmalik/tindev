class CreateUserInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :user_informations do |t|
      t.boolean :online, default: false
      t.string :github
      t.text :bio
      t.references :users

      t.timestamps
    end
  end
end
