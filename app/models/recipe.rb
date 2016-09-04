class Recipe < ActiveRecord::Base
  validates :title, :prep_time, :cook_time, :category_id, :description, :ingredients, :user_id, presence: true
  validates :description, length: { minimum: 10 }
  has_many :steps, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :category
  belongs_to :user
  accepts_nested_attributes_for :steps, reject_if: proc { |attributes| attributes['body'].length == 1 }, allow_destroy: true
end
