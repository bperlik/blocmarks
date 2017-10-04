class LikesController < ApplicationController
  include Pundit
  after_action :verify_authorized

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    @topic = @bookmark.topic
    @like = current_user.likes.build(bookmark: @bookmark)
    authorize @like

    if @like.save
      flash[:notice] = "Thanks for liking this bookmark!."
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash[:alert] = "There was an error saving your like. Please try again."
      redirect_to [@bookmark.topic, @bookmark]
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @topic = @bookmark.topic
    @like = @bookmark.likes.where(user_id: current_user.id).first
    authorize @like

    if @like.destroy
      flash[:notice] = "You unliked this bookmark."
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash[:alert] = "There was an error in unliking the bookmark. Please try again."
      redirect_to [@bookmark.topic, @bookmark]
    end
  end

end
