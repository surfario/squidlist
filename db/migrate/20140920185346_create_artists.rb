class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :artistpic
      t.string :link

      t.timestamps
    end
  end
end
