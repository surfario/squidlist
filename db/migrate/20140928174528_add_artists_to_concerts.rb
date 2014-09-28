class AddArtistsToConcerts < ActiveRecord::Migration
  def change
    add_column :concerts, :artists, :string
  end
end
