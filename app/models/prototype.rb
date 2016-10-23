class Prototype < ActiveRecord::Base
  has_many :images, dependent: :destroy
  has_many :likes
  has_many :comments
  belongs_to :user

  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['image'].blank? }

  def like_user(user)
    likes.find_by(user_id: user)
  end
end
