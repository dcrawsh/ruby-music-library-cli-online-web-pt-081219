module Concerns::Findable
  def find_by_name(name)
self.class.all.find {|item| item.name == name}
end 
end 