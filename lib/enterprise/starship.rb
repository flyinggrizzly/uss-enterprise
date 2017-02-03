require_relative 'blueprints.rb'

class Ship
  include Blueprints

  attr_reader :available_blueprints

  def initialize(type = nil)
    case type
    when nil
      @available_blueprints = Blueprints.new.gimme
    when 'SeaShip'
      @available_blueprints = SeaShipBlueprints.new.gimme
    when 'OrbitalShip'
      @available_blueprints = OrbitalShipBlueprints.new.gimme
    when 'StarShip'
      @available_blueprints = StarShipBlueprints.new.gimme
    end
  end

  def get_ship_blueprint(type)
    @blueprint = @available_blueprints[type]
  end

  def build_it
    puts @blueprint
  end
end

class SeaShip < Ship

  ## TODO: This... there has to be a better way to go super without overwriting what I need. Problem is, I need to run line 1 here, then line 2 in super... what about `yield`?
  def initialize
    super('SeaShip')
  end
end

class OrbitalShip < Ship
  def initialize
    super('OrbitalShip')
  end
end

class StarShip < Ship
  def initialize
    super('StarShip')
  end
end
