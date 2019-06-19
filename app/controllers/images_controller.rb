class ImagesController < ApplicationController
  def create
    uploader = ImageUploader.new
    uploader.store!(params[:image])
  end
end
