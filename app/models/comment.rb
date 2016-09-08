class Comment < ActiveRecord::Base
  validates :content, :user_id, :recipe_id, presence: true
  belongs_to :user
  belongs_to :recipe
end
