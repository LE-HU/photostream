class StaticPagesController < ApplicationController
  require "flickr"

  def index
    flickr = Flickr.new ENV["FLICKR_API_KEY"], ENV["FLICKR_SHARED_SECRET"]
    if params[:q]
      @photos = flickr.people.getPhotos(user_id: params[:q]).map { |photo| Flickr.url(photo) }
    else
      @photos = flickr.people.getPhotos(user_id: ENV["FLICKR_ID"]).map { |photo| Flickr.url(photo) }
    end
  end
end
