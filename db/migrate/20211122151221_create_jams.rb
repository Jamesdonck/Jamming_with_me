class CreateJams < ActiveRecord::Migration[6.1]
  def change
    create_table :jams do |t|
      t.references :user, null: false, foreign_key: true
      t.string :location
      t.datetime :date

      t.timestamps
    end
  end
end
