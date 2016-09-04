class Recipe < ActiveRecord::Base
  validates :title, :prep_time, :cook_time, :description, :ingredients, :user_id, :category, presence: true
  validates :ingredients, :description, length: { minimum: 10 }
  has_many :images, as: :imageable, dependent: :destroy
  has_many :steps, dependent: :destroy
  belongs_to :category
  belongs_to :user
  accepts_nested_attributes_for :steps, reject_if: proc { |attributes| attributes['body'].length == 1 }, allow_destroy: true
end
