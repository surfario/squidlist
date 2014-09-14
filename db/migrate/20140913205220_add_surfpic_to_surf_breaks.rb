class AddSurfpicToSurfBreaks < ActiveRecord::Migration
  def change
    add_column :surf_breaks, :surfpic, :string
  end
end
