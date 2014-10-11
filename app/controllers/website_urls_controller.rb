class WebsiteUrlsController < ApplicationController

  def index
    @website_urls = WebsiteUrl.all.recent
  end 
  
  def create
    @website_url = WebsiteUrl.create(name: params[:website_url][:name])
    unless @website_url.persisted?
      flash.now[:error] = @website_url.errors.full_messages.join('<br />')
    else
      flash.now[:notice] = 'URL successfully created'
    end
  end
end
