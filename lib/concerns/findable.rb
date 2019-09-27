module Concerns::Findable
  def self.find_by_name(name)
Song.all.find {|song| song.name == name}
end 
end 