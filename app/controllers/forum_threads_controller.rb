class ForumThreadsController < ApplicationController

  def index
    @forum_threads = ForumThread.orphan()
    @child_thread  = ForumThread.new
  end

  def show
    @forum_thread = ForumThread.find(params[:id])
    @child_thread = ForumThread.new user: @forum_thread.user, parent_thread: @forum_thread
  end

  def new
    @parent_thread  = ForumThread.new(parent_thread_id: params[:parent_id])
  end

  def create
    @parent_thread = ForumThread.new(forum_thread_params)

    if @parent_thread.save
      redirect_to forum_threads_path
    else
      render :new
    end
  end

  private

  def forum_thread_params
    params.require(:forum_thread).permit :parent_thread_id, :subject
  end

end
