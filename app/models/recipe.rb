class Recipe < ActiveRecord::Base
  has_many :images, as: :imageable
  has_many :steps
  has_many :videos
  belongs_to :category
end
