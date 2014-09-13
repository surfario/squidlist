class CreateUserSurfBreaks < ActiveRecord::Migration
  def change
    create_table :user_surf_breaks do |t|
      t.references :user, index: true
      t.references :surf_break, index: true

      t.timestamps
    end
  end
end
