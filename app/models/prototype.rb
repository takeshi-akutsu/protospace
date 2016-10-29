class Prototype < ActiveRecord::Base
  has_many :images, dependent: :destroy
  has_many :likes
  has_many :comments
  belongs_to :user

  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['image'].blank? }

  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :tag_list

  scope :order_popular, -> { order("likes_count DESC") }
  scope :order_newest, -> { order("created_at DESC") }

  def like_user(user)
    likes.find_by(user_id: user)
  end

  def get_first_image
    self.images.main.first.image
  end
end
