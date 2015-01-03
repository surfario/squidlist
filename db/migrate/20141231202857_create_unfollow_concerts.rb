class CreateUnfollowConcerts < ActiveRecord::Migration
  def change
    create_table :unfollow_concerts do |t|
      t.references :user, index: true
      t.references :concert, index: true

      t.timestamps
    end
  end
end
