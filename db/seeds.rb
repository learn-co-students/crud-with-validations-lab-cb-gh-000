Song.destroy_all
i = 0
5.times do
 i = i + 1
 Song.create(title: "Song #{i}", released: true, release_year: 2005 + i, artist_name: "Artist #{i}", genre: "Genre #{i}")
end
