require 'pry'
class Song
  attr_accessor :name, :artist_name

  @@all = []

  @@titles = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    
    song
  end

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(title)
    self.all.find{|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    if self.find_by_name(title) #check to see if it already exists
      self.find_by_name(title) 
    else 
      self.create_by_name(title) #creates new one if it doesn't exist
   end
  end

  def self.alphabetical
    self.all.sort_by {|a| [a.name]}
  end

  def self.new_from_filename(info)
    
    data = info.split(" - ")
    artist_name = data[0]
    title_raw = data [1]
    title = title_raw.split(".")
    song = self.new
    song.name = title[0]
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(info)
    data = info.split(" - ")
    artist_name = data[0]
    title_raw = data [1]
    title = title_raw.split(".")
    song = self.create
    song.name = title[0]
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def self.all 
    @@all
  end

  def save
    self.class.all << self
  end
  
end

