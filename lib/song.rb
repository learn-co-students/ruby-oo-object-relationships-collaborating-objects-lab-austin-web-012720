require 'pry'

class Song

  attr_accessor :name ,:artist
  @@all = []

  def initialize(name)
    @name = name
    save
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end

  def self.new_by_filename(file_name)
    split = file_name.split(" - ")
    artist = split[0]
    title = split[1].sub('.mp3','')
    song = Song.new(title)
    song.artist_name=(artist)
    song
  end
  
  def artist_name=(name)  ## assigns artist to song (creates artist if doesn't exist)
    artist = Artist.all.find { |artist| artist.name == name }
    if !artist
      artist = Artist.new(name)
      self.artist = artist
    else 
      self.artist = artist
    end
  end

end