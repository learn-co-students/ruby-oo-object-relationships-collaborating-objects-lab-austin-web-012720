require 'pry'
class MP3Importer
  attr_accessor :path    
  
  def initialize(test_music_path)
    @path = test_music_path
  end

  def files
    #@files => nil
    
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    # ||= (this is called the "double-pipe equals")an operator that assigns a value, 
    # much like = or our classic assignment operator, but will only complete the assignment 
    # if the left side of our operation returns false or nil 
    #.glob called on Dir selects all files in the current directory
    #https://medium.com/@mattcroak718/the-glob-blog-a479a185cb6a
  end

  def import
    files.map do |file|
    #files is an array of file names ie. ["Real Estate - It's Real - hip-hop.mp3", ...]    
      Song.new_by_filename(file)
    end
  end
end