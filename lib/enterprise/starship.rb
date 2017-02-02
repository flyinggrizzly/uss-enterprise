require_relative 'blueprints.rb'

class Ship
  include Blueprints

  def initialize(type)
    @available_blueprints = Blueprints.new.gimme
    @blueprint = self.get_ship_print(type)
  end

  def get_ship_print(type)
    @available_blueprints[type]
  end

  def build_it
    puts @blueprint
  end
end

class SeaShip < Ship

  ## TODO: This... there has to be a better way to go super without overwriting what I need. Problem is, I need to run line 1 here, then line 2 in super... what about `yield`?
  def initialize(type)
    @available_blueprints = SeashipBlueprints.new.gimme
    @blueprint = self.get_ship_print(type)
end

class OrbitalShip < Ship
end

class StarShip < Ship
end
