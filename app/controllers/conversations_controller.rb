class ConversationsController < ApplicationController

  def new
    @forum_thread = ForumThread.find params[:parent_id]
    @child_thread  = ForumThread.new(parent_thread_id: params[:parent_id])
  end

  def create
    @parent_thread = ForumThread.find params[:parent_thread_id]
    @parent_thread.child_threads.build forum_thread_params

    if @parent_thread.save
      redirect_to forum_thread_path(@parent_thread)
    else
      @forum_thread = @parent_thread 
      render 'forum_threads/show'
    end
  end

  private

  def forum_thread_params
    params.permit :parent_thread_id, :subject
  end

end
