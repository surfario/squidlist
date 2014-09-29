class CreateUserConcerts < ActiveRecord::Migration
  def change
    create_table :user_concerts do |t|
      t.references :user, index: true
      t.references :concert, index: true

      t.timestamps
    end
  end
end
