require_relative 'schematics.rb'

module Blueprints

  class Blueprints
    include ShipSchematics

    def initialize
      @schematics = Schematics.new
      @blueprints = Hash.new
      # Haven't decided if the parent object should have *all* the schematics, or none...
      # @blueprints = {
      #   'Sloop'                 => @schematics.sloop,
      #   'Carrier'               => @schematics.carrier,
      #   'Spaceshuttle'          => @schematics.spaceshuttle,
      #   'Constitution'          => @schematics.ss_constitution,
      #   'Constitution - refit'  => @schematics.ss_const_refit,
      #   'Excelsior'             => @schematics.ss_excelsior,
      #   'Ambassador'            => @schematics.ss_ambassador,
      #   'Galaxy'                => @schematics.ss_galaxy,
      #   'Sovereign'             => @schematics.ss_sovereign
      # }
    end

    def gimme
      @blueprints
    end
  end

  class SeaShipBlueprints < Blueprints
    def initialize
      super
      @blueprints = {
        'Sloop'                 => @schematics.sloop,
        'Carrier'               => @schematics.carrier
      }
    end
  end

  class OrbitalShipBlueprints < Blueprints
    def initialize
      shuttle =
      super
      @blueprints = {
        'Spaceshuttle' => @schematics.spaceshuttle
      }
    end
  end

  class StarShipBlueprints < Blueprints
    def initialize
      super
      @blueprints = {
        'Constitution'          => @schematics.ss_constitution,
        'Constitution - refit'  => @schematics.ss_const_refit,
        'Excelsior'             => @schematics.ss_excelsior,
        'Ambassador'            => @schematics.ss_ambassador,
        'Galaxy'                => @schematics.ss_galaxy,
        'Sovereign'             => @schematics.ss_sovereign
      }
    end
  end

end
