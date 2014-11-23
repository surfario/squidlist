class AddSongkickToUserInterests < ActiveRecord::Migration
  def change
    add_column :user_interests, :songkick, :string
  end
end
