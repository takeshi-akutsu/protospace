class Prototype < ActiveRecord::Base
  has_many :images, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes['image'].blank? }
end
