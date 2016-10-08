class AddLikesCountToPrototype < ActiveRecord::Migration
  def change
    add_column :prototypes, :likes_count, :integer
  end
end
