class Owner
  # code goes here
  attr_accessor :pets, :name
  attr_reader :species

  @@owners = []

  def initialize(name)
    @name = name
    @pets = {fishes: [], cats: [], dogs: []}
    @species = "human"

    @@owners << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.moods("happy")
    end
  end

  def play_with_cats
    @pets[:cats].each do |cat|
      cat.moods("happy")
    end
  end

  def feed_fish
    @pets[:fishes].each do |fish|
      fish.moods("happy")
    end
  end

  def sell_pets
    pet_dump = []

    @pets[:dogs].each do |dog|
      dog.moods("nervous")
    end
    @pets[:cats].each do |cat|
      cat.moods("nervous")
    end
    @pets[:fishes].each do |fish|
      fish.moods("nervous")
    end

    pet_dump << @pets.values
    @pets.clear
  end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end

  def self.all
    @@owners
  end

  def self.count
    @@owners.length
  end

  def self.reset_all
    @@owners.clear
  end

end
