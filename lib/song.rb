require 'pry'
class Song
  attr_accessor :name, :artist
  
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    
    self.class.all << self
  end

  def artist_name=(name)
   self.artist = Artist.find_or_create_by_name(name)
   artist.add_song(self)
  end

  def self.new_by_filename(filename)
    artist, song = filename.split(" - ")
    #if I assign this to just one variable it returns an array of strings
    #but I am able to assign two variables like this and it will split the 
    #filename and assign the first piece to the first variable and the second
    #piece to the second variable
    
    new_song = self.new(song)
    new_song.artist_name = artist
    #this is calling the artist_name = (name) method from above
    new_song
  end
end