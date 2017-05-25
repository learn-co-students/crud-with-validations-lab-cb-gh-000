class SongsController < ApplicationController
  def edit
    @song = Song.find(params[:id])
  end

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end
end
