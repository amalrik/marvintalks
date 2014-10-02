# == Schema Information
#
# Table name: forum_threads
#
#  id               :integer          not null, primary key
#  subject          :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  parent_thread_id :integer
#
# Indexes
#
#  index_forum_threads_on_parent_thread_id  (parent_thread_id)
#

class ForumThread < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :subject
  after_validation :sanitize_words

  has_many :child_threads, :class_name => "ForumThread", :foreign_key => "parent_thread_id"
  belongs_to :parent_thread, :class_name => "ForumThread"

  scope :orphan, -> { where(parent_thread: nil) }

  private
  def sanitize_words
    words = self.subject.split(" ")
    words.each_with_index do |word,index|
      if bad_word?(word)
        words[index] = replace word  
      end
    end
    self.subject = words.join(" ")
  end

  def replace(word)
    '*' * word.size
  end

  def bad_word?(word) 
    Rails.application.config.blacklist.include?(word)
  end
end
