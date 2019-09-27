require "spec_helper"

describe "Song" do
  let(:song) { Song.new("In the Aeroplane Over the Sea") }

  describe "#initialize" do
    it "accepts a name for the new song" do
      new_song = Song.new("Alison")

      new_song_name = new_song.instance_variable_get(:@name)

      expect(new_song_name).to eq("Alison")
    end
  end

  describe "#name" do
    it "retrieves the name of a song" do
      expect(song.name).to eq("In the Aeroplane Over the Sea")
    end
  end

  describe "#name=" do
    it "can set the name of a song" do
      song.name = "Jump Around"

      song_name = song.instance_variable_get(:@name)

      expect(song_name).to eq("Jump Around")
    end
  end

  describe "@@all" do
    it "is initialized as an empty array" do
      all = Song.class_variable_get(:@@all)

      expect(all).to match_array([])
    end
  end

  describe ".all" do
    it "returns the class variable @@all" do
      expect(Song.all).to match_array([])

      Song.class_variable_set(:@@all, [song])

      expect(Song.all).to match_array([song])
    end
  end

  describe ".destroy_all" do
    it "resets the @@all class variable to an empty array" do
      Song.class_variable_set(:@@all, [song])

      Song.destroy_all

      expect(Song.all).to match_array([])
    end
  end

  describe "#save" do
    it "adds the Song instance to the @@all class variable" do
      song.save

      expect(Song.all).to include(song)
    end
  end

  describe ".create" do
    it "initializes, saves, and returns the song" do
      created_song = Song.create("Kaohsiung Christmas")

      expect(Song.all).to include(created_song)
    end
  end
end

class Song 
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
Song.find_by_name(name) if true ? 
else 
Song.create(name)
end 

  
end 
