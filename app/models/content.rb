class Content < ActiveRecord::Base
	has_many :content_tags

	# Method for creating the Content and Contenttags for the Content
	def self.html_tags_content html_content
		# sorting the all header tags in order
		heads = Nokogiri::HTML(html_content).css('h1, h2, h3').sort()
		# create the content 
		content = self.create() unless heads.blank? 
		# loop for the header tags content
		heads.each do |header_tag|
			# creating the content tags for the content
			content.content_tags.create(content_id: content.id,tag_content: header_tag.children.first.text,
																	url: header_tag.at_css("a")[:href])
		end unless heads.blank?
	end
end
