class SongsController < ApplicationController
  def create
    @song = Song.new(params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre))

    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
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

  def update
    @song = Song.find(params[:id])
    @song.update(params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre))

    if @song.valid?
      redirect_to song_path(@song)
    else
      render :edit
    end
  end
end
