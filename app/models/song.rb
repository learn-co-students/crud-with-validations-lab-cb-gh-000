class Song < ActiveRecord::Base
  validate :rebundent_title, :toggle_released_time
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true

  def rebundent_title
    self.errors.add(:title, 'rebundent') unless Song.find_by(artist_name: self.artist_name, release_year: self.release_year) == nil
  end

  def toggle_released_time
    if self.released && (self.release_year.nil? || self.release_year > Time.now.year)
      self.errors.add(:released_year, "wrong released year")
    end
  end
end
