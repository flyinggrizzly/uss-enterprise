require_relative 'uss-enterprise/interactions.rb'
require_relative 'uss-enterprise/ship_chooser.rb'


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

  # parses and handles CLI arguments
  def handle_args
    begin
      if @params.length == 0
        self.build_ship('random', 'random')
      elsif @params.include? '-l'
        self.l_flag
      else
        self.gently_correct_usage
      end
    rescue
      self.gently_correct_usage
    end
    # TODO: handle class, captain, or ship name argument flags
  end

  def gently_correct_usage
    puts "For a random Enterprise, supply no arguments or flags. If you want to specify a ship, use the '-l' flag followed by one of the following arguments:\n\n"
    @letter_to_class.each do |arg, output|
      puts "\t#{arg} \t=> \t#{output}"
    end
  end
end
