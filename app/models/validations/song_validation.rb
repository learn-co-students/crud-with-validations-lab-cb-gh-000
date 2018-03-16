require 'date'
class SongValidation < ActiveModel::Validator
  def validate record
    assign_variables record
    title_uniqueness_per_artist_per_year
    release_year_when_released
    release_year_adequate_date if @record.release_year
  end

  def title_uniqueness_per_artist_per_year
    error_message =
      "This title has been used by this artist this year"
    song = Song.find_by(
      artist_name: @record.artist_name,
      release_year: @record.release_year,
      title: @record.title
    )
    @errors[:title] << error_message if song

  end

  def release_year_when_released
    error_message = "Released without date"
    if released? && release_year_nil?
      @errors[:release_year] << error_message
    end
  end

  def release_year_adequate_date
    error_message = "Release year must be adequate"
    condition  = Time.now.to_date.year >= @record.release_year
    unless condition
      @errors[:release_year] << error_message
    end
  end


  private

  def released?
    @record.released
  end

  def release_year_nil?
    @record.release_year == nil
  end

  def assign_variables record
    @record = record
    @errors = @record.errors
  end

end
