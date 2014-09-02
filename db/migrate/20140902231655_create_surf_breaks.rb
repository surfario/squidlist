class CreateSurfBreaks < ActiveRecord::Migration
  def change
    create_table :surf_breaks do |t|
      t.string :name
      t.text :mslink
      t.text :image

      t.timestamps
    end
  end
end
