class Step < ActiveRecord::Base
  validates :body, :recipe_id, presence: true
  validates :body, length: { minimum: 10 }
  belongs_to :recipe
end
