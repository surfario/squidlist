class CreateUserInterests < ActiveRecord::Migration
  def change
    create_table :user_interests do |t|
      t.boolean :surfing
      t.boolean :concerts
      t.boolean :free_events
      t.references :user, index: true

      t.timestamps
    end
  end
end
