class CommentsController < ApplicationController
  def index
  end

  def create
    @topic = Topic.find( params[:topic_id] )
    @post = @topic.posts.find( params[:post_id] )
    @comments = @post.comments

    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user

    if @comment.save
      redirect_to [@topic, @post], notice: "Comment saved successfully"
    else
      redirect_to [@topic, @post], notice: "There was an error saving the comment. Please try again."
    end
    authorize @comment
  end

    def comment_params
    params.require(:comment).permit(:body)
  end
end

 