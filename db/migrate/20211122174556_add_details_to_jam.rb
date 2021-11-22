class AddDetailsToJam < ActiveRecord::Migration[6.1]
  def change
    add_column :jams, :title, :string
    add_column :jams, :description, :string
  end
end
