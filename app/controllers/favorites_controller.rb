class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)

    if favorite.save
      flash[:notice] = "You favorited this post!"
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was an error favoriting this post. Please try again."
      redirect_to [post.topic, post]
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])

    if favorite.destroy
      flash[:notice] = "You unfavorited this post!"
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was an error unfavoriting this post. Please try again."
      redirect_to [post.topic, post]
    end
  end

end
