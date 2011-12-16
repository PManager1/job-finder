require 'rubygems'
require 'rss'
	# Allows open to access remote files
require 'open-uri'

class MainController < ApplicationController

  # GET /jobs
  # GET /jobs.json
  def welcome
	puts "in welcome"
	
	@jobitems = Job.all
	
	@jobs = Job.all
	@sarr = Array.new
	@jobitems.each do |job|
		 @sarr.push(job.source)
	end 
  end
  
  
  def links
	  #### your code goes here #####
	  mysource = Job.find(params[:topsource])
	  @joburl = mysource.url
	  
	  #myjob = Job.find(:all, :conditions => ["source = ?", mysource])
	  #myjob.nil?
	  #@sourcelink = myjob[0].url

		# What feed are we parsing?
		rss_feed = @joburl.to_s

		# Variable for storing feed content
		rss_content = ""

		# Read the feed into rss_content
		open(rss_feed) do |f|
		   rss_content = f.read
		end
		rss = RSS::Parser.parse(rss_content, false)
		@feed = rss
		
		
			
	  respond_to do |format|
	  format.js { render :layout => false}
	  format.html 
	  end
  end

  def index
  
  end

end
