class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
    
  end

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    song.save
    song
  
  end

def self.find_by_name(song_name)
    @@all.find {|song| song.name == song_name}

end

def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
#self.find_by_name(song_name) || self.create_by_name(song.name)
    end   
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
end

def self.new_from_filename(file_name)
  file_name.slice!(".mp3")
  attribute = file_name.split(" - ")
  song = Song.new 
  song.name = attribute[1]
  song.artist_name = attribute[0]
  song
  end

def self.create_from_filename(file_name)
  song = self.new_from_filename(file_name)
  song.save
end

def self.destroy_all
    @@all.clear
end
end