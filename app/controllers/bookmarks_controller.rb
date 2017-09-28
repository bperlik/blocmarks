class BookmarksController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  include Pundit

  def show
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def new
    @bookmark = Bookmark.new
    authorize @bookmark
    @topic = bookmark_topic
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark =  @topic.bookmarks.build(bookmark_params)
    @bookmark.user = current_user
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to [@topic, @bookmark], notice: "Your bookmark was saved."
    else
      flash.now[:alert] = "There was an error saving the bookmark. Please try again."
      render :new
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @topic = bookmark_topic
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @bookmark.assign_attributes(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark was updated."
      redirect_to topics_path
    else
      flash[:error] = "There was an error saving this bookmark. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was deleted."
      redirect_to topics_path
    else
      flash.now[:alert] = "There was an error deleting the bookmark. Please try again."
      redirect_to topics_path(@topic)
    end
  end

private

   def bookmark_topic
     @topic = Topic.find(params[:topic_id])
     @topic
   end

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

end
