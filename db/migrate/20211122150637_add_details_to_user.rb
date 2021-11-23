class AddDetailsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :bio, :text
    add_column :users, :instruments_played, :string, array: true, default:[]
  end
end
