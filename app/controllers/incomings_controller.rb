class IncomingsController < ApplicationController
skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # to see incoming data in server log
    # puts "INCOMING PARAMS HERE: #{params}"

    @user = User.find_by_email(params[:sender])
    @topic = Topic.find_by_subject](params[:subject])
    @bookmark = @topic.bookmarks.find_or_create_by(url: params["body-plain"])

    if @user.nil?
      @user = User.create!(email: params[:sender], password: "changeme", password_confirmation: "changeme")
    end

    if @topic.nil?
      @topic = Topic.create!(title: "Edit This Topic")
    end

    @bookmark.save
    head 200
  end
end
