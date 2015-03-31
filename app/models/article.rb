class Article < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :comments
  mount_uploader :image, ImageUploader
end
