require './enterprise/interactions.rb'
require './enterprise/ship_chooser.rb'


class Runner
  include UserInput

  def initialize(params)
    @params = params
    @flags = self.define_cli_flags
  end

  def build_random_ship
    need_ship = RandomShipChooser.new
    need_ship.choose_ship_group
    need_ship.choose_ship_class
    need_ship.commission_construction
  end

  def check_for_args
    if @params.length == 0
      self.build_random_ship
    elsif @params.length > 0
      puts "You wanted something not random?"
    end
  end

  def gently_correct_usage
  end
end

runner = Runner.new(ARGV)
runner.check_for_args
