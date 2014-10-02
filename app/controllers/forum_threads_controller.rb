class ForumThreadsController < ApplicationController

  def index
    @forum_threads = ForumThread.orphan()
  end

  def show
    @forum_thread = ForumThread.find(params[:id])
    @child_thread = ForumThread.new user: @forum_thread.user, parent_thread: @forum_thread
  end

  def new
    @child_thread  = ForumThread.new(parent_thread_id: params[:parent_id])
  end

  def create
    @parent_thread = ForumThread.find params[:forum_thread][:parent_thread_id]
    if child = ForumThread.create(forum_thread_child_params)
      @parent_thread.child_threads << child
      redirect_to forum_thread_path(@parent_thread)
    else
      render 'show'
    end
  end

  private

  def forum_thread_child_params
    params.require(:forum_thread).permit :parent_thread_id, :subject
  end
end
