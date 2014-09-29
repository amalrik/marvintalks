# == Schema Information
#
# Table name: forum_threads
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  subject    :string(255)
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_forum_threads_on_user_id  (user_id) UNIQUE
#

class ForumThread < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :subject
end
