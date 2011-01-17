class CommentsController < InheritedResources::Base

  before_filter :authenticate_contributor!
  belongs_to :task

  def edit
    edit! {
      if current_contributor != @comment.contributor
        redirect_to(project_task_path(@comment.task.project, @comment.task)) and return
      end
      @project = @task.project
    }
  end

  def new
    new! { @project = @task.project }
  end

  def create
    create! { redirect_to(project_task_path(@comment.task.project, @comment.task)) and return }
  end

  def update
    update! { redirect_to(project_task_path(@comment.task.project, @comment.task)) and return }
  end

  def destroy
    destroy! { redirect_to(project_task_path(@comment.task.project, @comment.task)) and return }
  end

end
