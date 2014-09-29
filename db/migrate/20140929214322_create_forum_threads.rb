class CreateForumThreads < ActiveRecord::Migration
  def change
    create_table :forum_threads do |t|
      t.integer :user_id
      t.string :subject

      t.timestamps
    end
    add_index :forum_threads, :user_id,                unique: true
  end
end
