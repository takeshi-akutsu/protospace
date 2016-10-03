class Image < ActiveRecord::Base
  belongs_to :prototype
  mount_uploader :image, ImageUploader

  enum status: { main: 1, sub: 2 }
end
