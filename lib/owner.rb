class Owner
  attr_accessor :name, :pets
  attr_reader :count, :species

  OWNERS = []

  def initialize(name, species = "human")
    @name = name
    OWNERS << self
    @species = species
    @pets = {:cats=>[],:dogs=>[],:fishes=>[]}
  end

  def self.all
    OWNERS
  end

  def self.count
    OWNERS.length
  end

  def self.reset_all
    OWNERS.clear
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |species,pets|
      pets.each do |pet|
        pet.mood = "nervous"
      end
    end
    @pets = {}
  end

  def list_pets
    fish_count = @pets[:fishes].length
    cat_count = @pets[:cats].length
    dog_count = @pets[:dogs].length

    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end



end