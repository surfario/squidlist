class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :event
      t.string :venue
      t.datetime :date
      t.string :link
      t.string :concertpic

      t.timestamps
    end
  end
end
