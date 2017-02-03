require './enterprise/ships.rb'

class ShipChooser
  def initialize
    @ship_group_options = {
      'StarShip'    => StarShipBuilder.new,
      'SeaShip'     => SeaShipBuilder.new,
      'OrbitalShip' => OrbitalShipBuilder.new
    }
  end

  def choose_ship_group(request)
    if request == 'random'
      group = @ship_group_options.keys.sample
    else
      group = request
    end

    @ship_builder = @ship_group_options[group]
  end

  def choose_ship_class(request)
    if request == 'random'
      # chooses a random key from the available blueprints
      @ship_class = @ship_builder.available_blueprints.keys.sample
    else
      @ship_class = request
    end
  end

  def commission_construction
    @ship_builder.define_blueprint(@ship_class)
    @ship_builder.build_it
  end
end
