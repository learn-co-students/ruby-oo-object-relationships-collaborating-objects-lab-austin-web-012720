# many to many class
# CLASS REQS 
# # name, artist
# # @@all data storage
class Song
  attr_accessor :name, :artist

  @@all = []

  def self.all
    @@all
  end 

  def initialize(name)
    @name = name
    @@all << self
  end 

  def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
    new_song = self.new(song)
    new_song.artist_name = artist
    new_song
  end 

  def artist_name=(name)
    # custom setter
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end 
end 