class IncomingsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user = User.find!(email: params[:sender])
    @topic = Topic.find!(title: params[:subject])

    if @user.nil?
      @user = User.create!(email: params[:sender], password: "change_me")
    end

    if @topic.nil?
      if params.[:subject].nil?
        @topic = Topic.create!(title: "Edit This Temporary Topic")
      else
        @topic = Topic.create!(title:params[:subject])
    end

    @bookmark = @topic.bookmarks.find_or_create_by!(url: params["body-plain"])
    @bookmark.save

    head 200
  end
end
