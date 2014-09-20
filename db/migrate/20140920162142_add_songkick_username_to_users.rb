class AddSongkickUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :songkick_username, :string
  end
end
