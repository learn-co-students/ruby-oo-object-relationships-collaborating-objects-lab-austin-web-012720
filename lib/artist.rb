class Artist
  attr_accessor :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name

    self.class.all << self  
  end 
  
  def add_song(song)
    song.artist = self
  end

  def songs
    Song.all.select do |song|
      song.artist == self
    end
  end

  def self.find(name)
    self.all.find do |artist|
      artist.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find(name)
      return self.find(name)
    else
      self.new(name)
    end 
  end

  def print_songs
    songs.map do |song|
      puts song.name
    end
  end

end