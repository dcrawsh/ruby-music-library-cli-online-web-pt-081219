class Song 
extend Concerns::Findable
attr_accessor :name, :artist, :genre 
attr_reader 
@@all = Array.new 

def self.all 
@@all  
end 

def self.destroy_all 
all.clear
end 

def self.create(name)
song = Song.new(name)
song.save
song 
end 

def save 
Song.all << self 
end 

def initialize(name, artist = nil, genre = nil)
@name = name 
self.artist = artist if artist 
self.genre = genre if genre 
end 

def artist=(artist)
    @artist = artist
    artist.add_song(self)
end

def genre=(genre)
  @genre = genre 
  genre.add_song(self)
end 

def self.find_by_name(name)
Song.all.find {|song| song.name == name}
end 

def self.find_or_create_by_name(name)
find_by_name(name) || create(name)
end 

  
end 
