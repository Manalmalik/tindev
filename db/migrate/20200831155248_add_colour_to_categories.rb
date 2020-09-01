class AddColourToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :colour, :string
  end
end
