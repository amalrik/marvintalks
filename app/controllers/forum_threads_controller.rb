class ForumThreadsController < ApplicationController

  def index
    @forum_threads = ForumThread.orphan().paginate(:page => params[:page])
    @child_thread  = ForumThread.new
  end

  def show
    @forum_thread = ForumThread.includes(:child_threads).find(params[:id])
    @child_threads= @forum_thread.child_threads.paginate(:page => params[:page], :per_page => 5)
    @child_thread = ForumThread.new parent_thread: @forum_thread
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
