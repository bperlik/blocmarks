class IncomingsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
   # puts "TEST Incoming params: #{params[:sender]} #{params[:subject]} #{ params["body-plain"]}"

    @user = user.find!(email: params[:sender])
    @topic = topic.find!(title: params[:subject])
    @url = params["body-plain"]

    if @user.nil?
      @user = User.create!(email: params[:sender], password: "change_me")
      @user.skip.confirmation!
    end

    if @topic.nil?
      if params.[:subject].nil?
        @topic = @user.topics.create!(title: "Edit This Temporary Topic")
      else
        @topic = @user.topics.create!(title: params[:subject])
    end

    @bookmark = @topic.bookmarks.create!(url: @url.strip, user: @user)

    head 200
  end
end
