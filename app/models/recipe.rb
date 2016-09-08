class Recipe < ActiveRecord::Base
  validates :title, :prep_time, :cook_time, :category_id, :description, :ingredients, :user_id, presence: true
  validates :description, length: { minimum: 10 }
  has_many :steps, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :category
  belongs_to :user
  has_many :like, dependent: :destroy
  accepts_nested_attributes_for :steps, reject_if: proc { |attributes| attributes['body'].length == 1 }, allow_destroy: true
  after_create :get_rep_img
  has_one :image, as: :imageable, dependent: :destroy

  def get_rep_img
    @default_image = '1http://res.cloudinary.com/wkdal720/image/upload/v1472659523/imageedit_1_3889917060_vq3dui.png'

    images = self.steps.select { |s| s['body'].start_with?('1') }
    images = images.sort_by { |s| s['order'] }
    rep_img_url = images.empty? ? @default_image : images.last['body']
    rep_img = Image.create!(url: rep_img_url)
    rep_img.imageable = self
    rep_img.save!
  end
end
