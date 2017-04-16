require_relative 'validations/song_validation'
class Song < ActiveRecord::Base
  validates_presence_of :title, :artist_name
  validates_with SongValidation
end
