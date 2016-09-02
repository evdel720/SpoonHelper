class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.text :ingredients, null: false
      t.integer :user_id, null: false, index: true
      t.integer :category_id, null: false, index: true
      t.integer :prep_time, null: false
      t.integer :cook_time, null: false

      t.timestamps null: false
    end
  end
end
