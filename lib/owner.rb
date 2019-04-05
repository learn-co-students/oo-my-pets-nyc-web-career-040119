require 'pry'

class Owner

  attr_reader :name, :species, :pets, :mood

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @pets = {fishes: [], dogs: [], cats: []}
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def name=(name)
    @name = name
  end

  def buy_fish(name)
    name = Fish.new(name)
    @pets[:fishes].push(name)
  end

  def buy_cat(name)
    name = Cat.new(name)
    @pets[:cats].push(name)
  end

  def buy_dog(name)
    name = Dog.new(name)
    @pets[:dogs].push(name)
  end

  def walk_dogs
    self.pets[:dogs].each { |dog| dog.mood=("happy")}
    # binding.pry
  end

  def play_with_cats
    self.pets[:cats].each { |cat| cat.mood=("happy")}
    #binding.pry
  end

  def feed_fish
    self.pets[:fishes].each { |fish| fish.mood=("happy")}
    #binding.pry
  end

  def pets=(pets)
    @pets = pets
  end

  def sell_pets
    self.pets[:dogs].each { |dog| dog.mood=("nervous")}
    self.pets[:cats].each { |cat| cat.mood=("nervous")}
    self.pets[:fishes].each { |fish| fish.mood=("nervous")}
    @pets.clear
    # binding.pry
  end

  def list_pets
    dog_count = self.pets[:dogs].length
    cat_count = self.pets[:cats].length
    fish_count = self.pets[:fishes].length

    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."

  end

end
