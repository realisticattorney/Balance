class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :fullname, :string
    add_column :users, :cover_photo, :string
    add_column :users, :avatar_photo, :string
  end
end
