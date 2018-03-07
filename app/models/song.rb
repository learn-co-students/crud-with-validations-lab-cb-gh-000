class UniqArtistYearTitle < ActiveModel::Validator
  def validate(record)
    @son = Song.find_by(artist_name: record.artist_name, release_year: record.release_year)
      if @son && @son.title == record.title
        record.errors[:name] << 'Need a uniq title with the same year and artist please!'
      end
  end
end

class ReleaseYearValiation < ActiveModel::Validator

  def validate(record)
    if record.released && (!record.release_year || record.release_year > DateTime.now.year)
      record.errors[:name] << "Must be less than the current year"
    end
  end

end

class Song < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates_with UniqArtistYearTitle
  validates_with ReleaseYearValiation
  validates :artist_name, presence: true
end
