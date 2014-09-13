class AddSpotIdToSurfBreak < ActiveRecord::Migration
  def change
    add_column :surf_breaks, :spot_id, :string
  end
end
