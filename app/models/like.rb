class Like < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user
  validates :recipe, :user, presence: true
  validates :recipe_id, uniqueness: { scope: :user_id }
end
