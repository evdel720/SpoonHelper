class Step < ActiveRecord::Base
  validates :body, :recipe_id, presence: true
  belongs_to :recipe
end
