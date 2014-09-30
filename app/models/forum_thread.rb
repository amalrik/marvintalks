# == Schema Information
#
# Table name: forum_threads
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  subject          :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  parent_thread_id :integer
#
# Indexes
#
#  index_forum_threads_on_parent_thread_id  (parent_thread_id)
#  index_forum_threads_on_user_id           (user_id) UNIQUE
#

class ForumThread < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :subject

  has_many :child_threads, :class_name => "ForumThread", :foreign_key => "parent_thread_id"
  belongs_to :parent_thread, :class_name => "ForumThread"
end
