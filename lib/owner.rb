class Owner
  # code goes here
  attr_accessor :name, :pets
  attr_reader :species
  @@all =[]

  @@count_for_dog = 0
  @@count_for_cat = 0
  @@count_for_fish = 0

  def initialize(name)
    @name = name
    @species = "human"
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@all << self
  end


  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    @@all = []
  end


  ############instance methods
  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    @pets[:fishes] << new_fish
    @@count_for_fish += 1
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    @pets[:cats] << new_cat
    @@count_for_cat += 1
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    @pets[:dogs] << new_dog
    @@count_for_dog += 1
  end

  def walk_dogs
    @pets[:dogs].each do |puppy|
      puppy.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].each do |kitten|
      kitten.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end


  def sell_pets
    # self.pets.each do |type|
    #   type.each do |pet|
    #     pet.mood = "nervous"
    @pets.collect do |key, value|
      value.each do |pet|
        pet.mood = "nervous"
      end
      @pets = []
      end
    end


  def list_pets
    # "I have #{@@count_for_fish} fish, #{@@count_for_dog} dog(s), and #{@@count_for_cat} cat(s)."
    num_dog = @pets[:dogs].size
    num_cat = @pets[:cats].size
    num_fish = @pets[:fishes].size

   "I have #{num_fish} fish, #{num_dog} dog(s), and #{num_cat} cat(s)."
  end

end
