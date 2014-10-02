class RemoveUserIdFromForumThreads < ActiveRecord::Migration
  def change
    remove_column :forum_threads, :user_id
  end
end
