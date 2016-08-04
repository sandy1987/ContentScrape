class Api::V1::ContentsController < ApplicationController
	# Require Nokogiri to Parse HTML Tags
	require 'nokogiri'

	# Method for Create the Content with content tags
	def create
		# Initialize params
		content_tags = params[:content][:html_content]
		# Create Content html tags for the Content
		content = Content.html_tags_content(content_tags) unless content_tags.empty?
		# Created Content
		if content
			# Render Success => True
			render :json=>{:success=>true,:message=>"ContentTag and URL are Stored Successfully"}
		else
			# else Render Success => False
			render :json=>{:success=>false,:message=>"ContentTag and URL are Not Stored, Please Pass Valid Parameters"}
		end
	end

	# Method for Listing out the ContentTags with Text and URL
	def index
		# All Content tags
		contents = ContentTag.all
		render json: contents
	end
end
