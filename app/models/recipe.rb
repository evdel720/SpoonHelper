class Recipe < ActiveRecord::Base
  validates :title, :description, :ingredients, :user_id, :category_id, presence: true
  validates :ingredients, :description, length: { minimum: 10 }
  has_many :images, as: :imageable, dependent: :destroy
  has_many :steps, dependent: :destroy
  belongs_to :category
  belongs_to :user
  accepts_nested_attributes_for :steps, reject_if: proc { |attributes| attributes['body'].blank? }, allow_destroy: true
end
