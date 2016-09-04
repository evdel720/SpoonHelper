class Category < ActiveRecord::Base
  has_one :image, as: :imageable, dependent: :destroy
  has_many :recipes
  validates :title, presence: true
end
