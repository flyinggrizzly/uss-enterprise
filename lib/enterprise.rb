require './enterprise/starship.rb'


class ShipChooser

  def initialize
    @ship_group_options = {
      'StarShip'    => StarShip.new,
      'SeaShip'     => SeaShip.new,
      'OrbitalShip' => OrbitalShip.new
    }
  end

  def choose_ship_group
    random = Random.new.rand(@ship_group_options.keys.length)
    key = @ship_group_options.keys[random]
    @ship_group = @ship_group_options[key]
  end

  def choose_ship_class
    ship_class_options = @ship_group.available_blueprints.keys

    num_options = ship_class_options.length

    @ship_class = ship_class_options[Random.new.rand(num_options)]
  end

  def commission_construction
    @ship_group.get_ship_blueprint(@ship_class)
    @ship_group.build_it
  end
end


needs_ship = ShipChooser.new
needs_ship.choose_ship_group
needs_ship.choose_ship_class
needs_ship.commission_construction
