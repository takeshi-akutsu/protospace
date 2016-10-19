class Like < ActiveRecord::Base
  belongs_to :prototype, counter_cache: :likes_count
  belongs_to :user

  validates :user_id,
    uniqueness: {
      message: "ERROR: user_idとprototype_idの同じレコードがすでに存在します。",
      scope: [:prototype_id]
    }

end
