class AddArtistToConcerts < ActiveRecord::Migration
  def change
    add_column :concerts, :artist_id, :integer
    add_index :concerts, :artist_id
  end
end
