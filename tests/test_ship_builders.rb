require 'test/unit'
require 'uss-enterprise/blueprint.rb' # has its own test

# testing this
require 'uss-enterprise/ship_builders.rb'

class TestShipBuilder < Test::Unit::TestCase
  include Blueprints

  def test_initialize

    #test initializing ShipBuilder with each of its possible inputs
    expected_types = {
      nil           => Blueprints.new.gimme,
      'SeaShip'     => SeaShipBlueprints.new.gimme,
      'OrbitalShip' => OrbitalShipBlueprints.new.gimme,
      'StarShip'    => StarShipBlueprints.new.gimme
    }

    expected_types.each do |type, b_prints|
      ship_builder = ShipBuilder.new(type)

      assert_equal(b_prints, ship_builder.available_blueprints)
    end

    # test bad input
    ship_builder = ShipBuilder.new('foo')
    assert_equal(nil, ship_builder.available_blueprints)
  end

  def test_define_blueprint

    # test on sea subtype
    sea_possible_prints = SeaShipBlueprints.new.gimme
    sea_possible_prints.each do |name, b_print|

      ship_builder = SeaShipBuilder.new
      ship_builder.define_blueprint(name)

      assert_equal(b_print, ship_builder.blueprint)
    end

    # test on orbital subtype
    orb_possible_prints = OrbitalShipBlueprints.new.gimme
    orb_possible_prints.each do |name, b_print|

      ship_builder = OrbitalShipBuilder.new
      ship_builder.define_blueprint(name)

      assert_equal(b_print, ship_builder.blueprint)
    end

    # test on star subtype
    star_possible_prints = StarShipBlueprints.new.gimme
    star_possible_prints.each do |name, b_print|

      ship_builder = StarShipBuilder.new
      ship_builder.define_blueprint(name)

      assert_equal(b_print, ship_builder.blueprint)
    end
  end

  def test_build_it
    expected_prints = {
      'SeaShip'     => SeaShipBlueprints.new.gimme,
      'OrbitalShip' => OrbitalShipBlueprints.new.gimme,
      'StarShip'    => StarShipBlueprints.new.gimme
    }

    expected_prints.each do |type, possible_prints|
      ship_builder = ShipBuilder.new(type)

      possible_prints.each do |s_class, b_print|
        ship_builder.define_blueprint(s_class)

        out = capture_output do
          ship_builder.build_it
        end

        assert_equal(b_print.chomp, out[0].chomp)
      end
    end
  end
end
