class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url, null: false
      t.integer :order
      t.integer :recipe_id, null: false
      t.timestamps null: false
    end

    add_index :videos, :recipe_id
  end
end
