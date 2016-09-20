class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :works, :text
    add_column :users, :self_intro, :text
    add_column :users, :member, :string
  end
end
