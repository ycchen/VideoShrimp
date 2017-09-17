class VideosController < ApplicationController
	before_action :authenticate_user!
	before_action :set_video, only: [:show, :edit, :like, :dislike]

	#All published videos

	def index
		@videos = Video.where(published: true)
	end

	def show
	end

	def new
		@video = Video.new
	end

	def create
		@video = Video.new(video_params)
	end

	#Likes video, increment likes count
	def like
		@video.like!
	end

	def dislike
		@video.dislike!
	end

	private
	def set_video
		@video = Video.find(params[:id])
	end

	def video_params
		params.require(:video).permit(:video_file, :name)
	end

end