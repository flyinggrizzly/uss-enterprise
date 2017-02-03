module UserInput

  def prompt
    print "> "
    response = $stdin.gets.chomp
    return response
  end

  def define_cli_flags
    @flags = {
      '-c' => "ship class",
      '-g' => "ship group (starship, seaship, orbitalship)",
      '-C' => "captain",
      '-i' => "interactive",
      '-r' => "random",
      '-n' => "number (of ships)",
      '-l' => "letter"
    }
    @flags
  end

  def define_class_to_group
    @class_to_group = {
      'sovereign'            => 'StarShip',
      'galaxy'               => 'StarShip',
      'ambassador'           => 'StarShip',
      'excelsior'            => 'StarShip',
      'constitution'         => 'StarShip',
      'constitution - refit' => 'StarShip',
      'nx'                   => 'StarShip',
      'spaceshuttle'         => 'OrbitalShip',
      'carrier'              => 'SeaShip',
      'sloop'                => 'SeaShip'
    }
    @class_to_group
  end

  def look_up_class_group(s_class)
    s_class = s_class.downcase
    group = @class_to_group[s_class]
    return group
  end

  def define_groups
    @groups = {
      'star'    => 'StarShip',
      'sea'     => 'SeaShip',
      'orbital' => 'OrbitalShip'
    }
    @groups
  end

  def classes
    @classes = {

    }
  end

  def define_letter_to_class
    @letter_to_class = {
      'rev'  => 'Sloop',
      'cvn'  => 'Carrier',
      'ov'   => 'Spaceshuttle',
      'nx'   => 'NX',
      'none' => 'Constitution',
      'a'    => 'Constitution - refit',
      'b'    => 'Excelsior',
      'c'    => 'Ambassador',
      'd'    => 'Galaxy',
      'e'    => 'Sovereign'
    }
    @letter_to_class
  end

  def look_up_letter_class(letter)
    s_class = @letter_to_class[letter]
    return s_class
  end

  def print_options(options)
    # handle arrays and hashes as input
    # call .each_with_index and output the options
  end
end
