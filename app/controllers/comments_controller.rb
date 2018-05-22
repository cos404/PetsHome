class CommentsController < ApplicationController
  before_action :load_commentable

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment

    params = {commentable_type: @comment.commentable_type, commentable_id: @comment.commentable_id, user_id: @comment.user_id}
    @comment.create_activity(:destroy, owner: current_user, params: params)

    if @comment.destroy
      render json: @comment, status: :ok
    else
      render js: "alert('error deleting comment');"
    end
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    authorize @comment

    @comment.user_id = current_user.id
    if @comment.save
      render partial: "comments/comment", locals: { comment: @comment }, layout: false, status: :created
    else
      render js: "alert(#{t('view.comment.delete.error')});"
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end
end