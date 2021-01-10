class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :recipe_name
      t.string :serving_size
      t.text :ingredients
      t.text :directions
      t.integer :user_id
      t.integer :category_id
    end
  end
end
