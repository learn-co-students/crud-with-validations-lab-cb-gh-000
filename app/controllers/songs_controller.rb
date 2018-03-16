class SongsController < ApplicationController
  before_action :set_song, only:[:edit,:show,:update,:destroy]

  def index
    @songs = Song.all
    render :index
  end

  def show
    render :show
  end

  def new
    @song = Song.new
    render :new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path @song
    else
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if @song.update(song_params)
      redirect_to song_path @song
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end


  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(
      :title,
      :artist_name,
      :release_year,
      :released,
      :genre
    )
  end

end
