class UrlsController < ApplicationController
    def new
      @url = Url.new
    end
  
    def create
      @url = Url.new(url_params)
      if @url.save
        redirect_to shortened_url_path(@url.shortened)
      else
        render :new
      end
    end
  
    def show
      @url = Url.find(params[:id])
    end
  
    def redirect
      @url = Url.find_by(shortened: params[:shortened])
      if @url
        redirect_to @url.original
      else
        redirect_to root_path, alert: 'Invalid URL'
      end
    end
  
    private
  
    def url_params
      params.require(:url).permit(:original)
    end
  end
  