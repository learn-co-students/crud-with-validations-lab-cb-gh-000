class SongsController < ApplicationController

  def index
  end

  def show
    @song = Song.find(params[:id])
  end

  def new 
    @song = Song.new
  end

  def create
    # @song = Song.new(#put params here)
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
  end

  def destroy
    Song.find(params[:id]).destroy
  end

end