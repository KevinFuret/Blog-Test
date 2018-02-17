class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|

      t.references :user, null: false, foreign_key: { name: 'user_on_post' }

      t.string :title, null: false, limit: 150
      t.text :text, null: false

      t.timestamps
    end
    add_index :posts, :title, unique: true
  end
end