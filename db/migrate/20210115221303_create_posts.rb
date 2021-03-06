class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.integer :points
      t.string :tag
      t.boolean :private, :default => false # by default the post is public
      t.integer :user_id
      t.timestamps
    end
  end
end
