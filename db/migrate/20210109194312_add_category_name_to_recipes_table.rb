class AddCategoryNameToRecipesTable < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :category_name, :string
  end
end
