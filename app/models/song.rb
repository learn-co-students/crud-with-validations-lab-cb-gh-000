class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year, message: "can't be repeated in the same year" }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true

  with_options if: :released do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }
  end
end
