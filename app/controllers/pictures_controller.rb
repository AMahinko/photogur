class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    render text: "Saving a picture. URL: #{params[:url]}, Title: #{params[:title]}, Artist: #{params[:artist]}"
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to_pictures_url
    else
      render :new
    end
  end

  def show

    @picture = Picture.find(params[:id])

  end

  private
  def picture_params
    params.require(:picture).permit(:artist, :title, :url)
  end

end
