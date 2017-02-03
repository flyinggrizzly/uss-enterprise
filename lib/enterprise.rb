require_relative 'enterprise/interactions.rb'
require_relative 'enterprise/ship_chooser.rb'


class Runner
  include UserInput

  def initialize(params = nil)
    @params = params
    @flags = self.define_cli_flags
    @letter_to_class = self.define_letter_to_class
    @class_to_group = self.define_class_to_group
  end

  def build_ship(s_group, s_class)
    ship = ShipChooser.new
    ship.choose_ship_group(s_group)
    ship.choose_ship_class(s_class)
    ship.commission_construction
  end

  def handle_args
    if @params.length == 0
      self.build_ship('random', 'random')
    elsif @params.include? '-l'
      self.l_flag
    else
      self.gently_correct_usage
    end
  end

  def gently_correct_usage
    puts "uh oh"
  end
end

# runner = Runner.new(ARGV)
# runner.check_for_args

make = Runner.new(ARGV)
make.handle_args
