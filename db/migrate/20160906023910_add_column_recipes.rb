class AddColumnRecipes < ActiveRecord::Migration
  def change
    add_column(:recipes, :rep_img, :string)
  end
end
