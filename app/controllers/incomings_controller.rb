class IncomingsController < ApplicationController
<<<<<<< HEAD
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user = User.find(params[:sender])
    @topic = Topic.find_or_create_by(title: params[:subject])
=======
skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # to see incoming data in server log
    # puts "INCOMING PARAMS HERE: #{params}"

    @user = User.find_by_email(params[:sender])
    @topic = Topic.find_by_subject](params[:subject])
>>>>>>> 6e096c01d619561abc21f0e6aa085d873177d2bf
    @bookmark = @topic.bookmarks.find_or_create_by(url: params["body-plain"])

    if @user.nil?
      @user = User.create!(email: params[:sender], password: "changeme", password_confirmation: "changeme")
    end

<<<<<<< HEAD
=======
    if @topic.nil?
      @topic = Topic.create!(title: "Edit This Topic")
    end

>>>>>>> 6e096c01d619561abc21f0e6aa085d873177d2bf
    @bookmark.save
    head 200
  end
end
