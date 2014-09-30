class AddParentThreadIdToForumThread < ActiveRecord::Migration
  def change
    add_column :forum_threads, :parent_thread_id, :integer
    add_index :forum_threads, :parent_thread_id
  end

end
