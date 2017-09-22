class IncomingController < ApplicationController
   skip_before_action :verify_authenticity_token, only: [:create]
   skip_before_action :authenticate_user!

   def create
     # Watch server logs to see the format of params that are delivered here
     # puts "TEST Incoming params: #{params[:sender]} #{params[:subject]} #{ params["body-plain"]}"

     # Find user by using params[:sender]
     @user = User.find!(email: params[:sender])
     # Find topic by using params[:subject]
     @topic = Topic.find!(title: params[:subject])
     # Assign url to a variable after retrieving it from params['body-plain']
     @url = params["body-plain"]

     # Check if user is nil, if so, create and save a new user
     if @user.nil?
       @user = User.create!(email: params[:sender], password: "change_me")
       @user.skip.confirmation!
       @user.save
     end

     # Check if topic is nil, if so, create and save new topic
     if @topic.nil?
       @topic = Topic.create!(title: params[:subject])
       @topic.save
     end

     # Build and save a new bookmark
     @bookmark = @topic.bookmarks.create!(url: @url.strip)
     @bookmark.save

     head 200
   end
end
