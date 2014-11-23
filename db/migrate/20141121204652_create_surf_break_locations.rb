class CreateSurfBreakLocations < ActiveRecord::Migration
  def change
    create_table :surf_break_locations do |t|
      t.string :name

      t.timestamps
    end
  end
end
