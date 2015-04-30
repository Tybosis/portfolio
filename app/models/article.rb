class Article < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :comments
  mount_uploader :image, ImageUploader

  def image_name
    File.basename(image.path || image.filename) if image
  end
end
