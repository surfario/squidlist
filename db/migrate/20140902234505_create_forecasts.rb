class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.date :date
      t.string :quality
      t.references :surf_break, index: true

      t.timestamps
    end
  end
end
