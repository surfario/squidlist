class AddSurfBreakLocationToSurfBreaks < ActiveRecord::Migration
  def change
    add_column :surf_breaks, :surf_break_location_id, :integer
    add_index :surf_breaks, :surf_break_location_id
  end
end
