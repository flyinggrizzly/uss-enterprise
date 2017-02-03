require './enterprise/interactions.rb'
require './enterprise/ship_chooser.rb'


class Runner
  include UserInput

  def initialize(params = nil)
    @params = params
    @flags = self.define_cli_flags
    @letter_to_class = self.define_letter_to_class
    @class_to_group = self.define_class_to_group
  end

  def build_random_ship
    ship = ShipChooser.new
    ship.choose_ship_group('random')
    ship.choose_ship_class('random')
    ship.commission_construction
  end

  def build_ship(s_group, s_class)
    ship = ShipChooser.new
    ship.choose_ship_group(s_group)
    ship.choose_ship_class(s_class)
    ship.commission_construction
  end

  # still need to reqrite the random build method above so it can be called here depending on flags
  def parse_args
    if @params.length == 0
      self.build_random_ship
    elsif @params.include? '-l'
      index_of_requested_letter = @params.find_index('-l') + 1
      letter = @params[index_of_requested_letter]
      s_class = look_up_letter_class(letter)
      s_group = look_up_class_group(s_class)
      self.build_ship(s_group, s_class)
    else
      self.gently_correct_usage
    end
  end

  def gently_correct_usage
  end
end

# runner = Runner.new(ARGV)
# runner.check_for_args

make = Runner.new(ARGV)
make.parse_args
