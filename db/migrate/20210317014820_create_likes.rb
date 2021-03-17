class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.integer :recipe_id
      t.integer :user_id
    end
    add_foreign_key :likes, :users, column: :user_id
    add_foreign_key :likes, :recipes, column: :recipe_id
  end
end