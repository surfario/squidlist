class AddHeightToForecasts < ActiveRecord::Migration
  def change
    add_column :forecasts, :height, :string
  end
end
