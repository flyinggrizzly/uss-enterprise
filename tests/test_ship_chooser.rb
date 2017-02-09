require 'test/unit'
require 'uss-enterprise/ship_builders.rb'

require 'uss-enterprise/ship_chooser.rb'

class TestShipChooser < Test::Unit::TestCase

  def setup
    @chooser = ShipChooser.new
  end

  def test_choose_ship_group

    requests = {
      #'random'      => , # not sure how to test this
      'StarShip'    => StarShipBuilder.new,
      'SeaShip'     => SeaShipBuilder.new,
      'OrbitalShip' => OrbitalShipBuilder.new
    }

    requests.each do |group, builder|
      # assert against the available_blueprints attribute, because we don't want to assert that the addresses in memory are equal, just the values chosen by the choose_ship_group method
      assert_equal(builder.available_blueprints, @chooser.choose_ship_group(group).available_blueprints)
    end

    # assert_include(requests.values, @chooser.choose_ship_group('random'))
  end

  def test_choose_ship_class
    sea_classes = ['Sloop', 'Carrier']
    orbital_classes = ['Spaceshuttle']
    star_classes = ['NX', 'Constitution', 'Constitution - refit', 'Excelsior', 'Ambassador', 'Galaxy', 'Sovereign', 'Intrepid']

    ship_groups = {
      'SeaShip'     => sea_classes,
      'OrbitalShip' => orbital_classes,
      'StarShip'    => star_classes
    }

    ship_groups.each do |group, classes|
      @chooser.choose_ship_group(group)
      classes.each do |c|
        @chooser.choose_ship_class(c)

        assert_equal(c, @chooser.ship_class)
      end
    end

    # test random ship class
    ship_groups.each do |group, classes|
      @chooser.choose_ship_group(group)
      @chooser.choose_ship_class('random')

      assert_include(classes, @chooser.ship_class)
    end
  end

end
