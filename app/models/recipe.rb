class Recipe < ActiveRecord::Base
  validates :title, :description, :ingredients, :user_id, :category_id, presence: true
  validates :ingredients, :description, length: { minimum: 10 }
  has_many :images, as: :imageable
  has_many :steps
  has_many :videos
  belongs_to :category
end
