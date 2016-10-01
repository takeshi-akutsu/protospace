class Prototype < ActiveRecord::Base
  has_many :images
  belongs_to :user
  accepts_nested_attributes_for :images

  def main_image
    self.images.each do |image|
      if image.status == 1
        return image
      end
    end
  end

  def sub_images
    images = []
    self.images.each do |image|
      if image.status == 2
        images << image
      end
    end
    images
  end
end
