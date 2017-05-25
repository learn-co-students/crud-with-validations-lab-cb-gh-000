class SongsController < ApplicationController
  def create
    @song = Song.new(params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre))
    @song.save
    redirect_to song_path(@song)
  end

  def edit
    @song = Song.find(params[:id])
  end

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def show
    @song = Song.find(params[:id])
  end
end
