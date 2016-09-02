class Recipe < ActiveRecord::Base
  validates :title, :description, :ingredients, :user_id, :category_id, presence: true
  validates :ingredients, :description, length: { minimum: 10 }
  has_many :images, as: :imageable, autosave: true, dependent: :destroy
  has_many :steps, autosave: true, dependent: :destroy
  has_many :videos, autosave: true, dependent: :destroy
  belongs_to :category
  belongs_to :user
end
