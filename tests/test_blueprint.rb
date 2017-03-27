require 'test/unit'
require 'uss-enterprise/blueprint.rb'
require 'uss-enterprise/schematics.rb'

class TestBlueprints < Test::Unit::TestCase
  include ShipSchematics
  include Blueprints

  def setup
    @schematics = Schematics.new
  end

  def test_sea_ship_blueprints

    expectation = {
      'Sloop'       => @schematics.sloop,
      'Carrier'     => @schematics.carrier
    }

    assert_equal(expectation, SeaShipBlueprints.new.gimme)
  end

  def test_orbital_ship_blueprints

    expectation = {
      'Spaceshuttle' => @schematics.spaceshuttle
    }

    assert_equal(expectation, OrbitalShipBlueprints.new.gimme)
  end

  def test_star_ship_blueprints

    expectation = {
      'NX'                    => @schematics.ss_nx,
      'Constitution'          => @schematics.ss_constitution,
      'Constitution - refit'  => @schematics.ss_const_refit,
      'Excelsior'             => @schematics.ss_excelsior,
      'Ambassador'            => @schematics.ss_ambassador,
      'Galaxy'                => @schematics.ss_galaxy,
      'Sovereign'             => @schematics.ss_sovereign,
      'Intrepid'              => @schematics.ss_intrepid
    }

    assert_equal(expectation, StarShipBlueprints.new.gimme)
  end
end
