class RemoveOldStuff < ActiveRecord::Migration
  def up
   drop_table :interests
   remove_column :users, :songkick_username
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
