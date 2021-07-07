class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    file_names = Dir.children(@path)
  end

  def import
    file_names = self.files
    file_names.each { |file_name| Song.new_by_filename(file_name)}
  end

end

# "Action Bronson - Larry Csonka - indie.mp3"