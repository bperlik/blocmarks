class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
    @topic = Topic.find(params[:topic_id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark =  @topic.bookmarks.build(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to [@topic, @bookmark]
    else
      flash.now[:alert] = "There was an error saving the bookmark. Please try again."
      render: new
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id]
  end

  def update
    @bookmark = Bookmark.find(params[:id]
    @bookmark.assign_attributes(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark was updated."
      redirect_to topics_path
    else
      flash[:error] = "There was an error saving this bookmark. Please try again."
      render :edit
    end
  end

 private

  def bookmark_params
    params.require(:bookmark).permit(:url, :public)
  end

end
