class Video < ActiveRecord::Base
  belongs_to :recipe
  validates :url, presence: true
end
