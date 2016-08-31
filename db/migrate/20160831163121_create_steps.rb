class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.text :body, null: false
      t.integer :order
      t.integer :recipe_id, null: false
      t.timestamps null: false
    end

    add_index :steps, :recipe_id
  end
end
