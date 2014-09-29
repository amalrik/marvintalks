class ForumThreadsController < ApplicationController
  def index
    @forum_threads = ForumThread.all
  end
end
