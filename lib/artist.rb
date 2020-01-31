# many to many class
# CLASS REQS
# # name, song
# # @@all data storage
class Artist
  attr_accessor :name, :song

  @@all = []
  def self.all
    @@all
  end 

  def initialize(name)
    @name = name
    @@all << self
  end 

  def songs
    # get all songs for artist
    # goes into Song class @@all array
    # searches through for artist value == self
    Song.all.select { |s| s.artist == self }
  end 

  def add_song(song)
    # adds artist self to song
    song.artist = self
  end 

  def self.find_or_create_by_name(name)
    # if else logic
    # search for artist name and return it or create it
    self.find(name) ? self.find(name) : self.new(name)
  end 

  def self.find(name)
    self.all.find { |a| a.name == name }
  end 

  def print_songs
    songs.each { |s| puts s.name }
  end 

end 