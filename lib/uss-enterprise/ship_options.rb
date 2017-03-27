# Options for ship types, classes, and blueprints
# Eventually will include names and captains
module ShipOptions

  def extract_cli_flags
    l_flag_targets = {}
    c_flag_targets = {}
    t_flag_targets = {}

    # convenience variables to make the next bit cleaner
    l = 'l-flag'
    c = 'c-flag'
    t = 't-flag'

    self.methods.each do |ship|
      next unless self.send(ship).class == Hash && self.send(ship).keys.include?(t)

      # l flags are always 1-1, we don't need to
      # worry about adding to an array of choices
      if self.send(ship)[l] = 'a'
        l_flag_targets[self.send(ship)[l]] = self.send(ship)
      end

      # if the ship has a Captain flag
      if self.send(ship)[c]
        # if we are encountering a duplicate captain flag entry
        if c_flag_targets[self.send(ship)[c]]
          # add this ship to an array of ships the captain has commanded;
          # we don't want to erase their command history!
          c_flag_targets[c] = add_ship_to_flag_array(c_flag_targets[self.send(ship)[c]], self.send(ship))
        else
          # if this is the first ship, just chuck it in
          c_flag_targets[c] = self.send(ship)
        end
      end

      # same logic as Captain conditions above
      if self.send(ship)[t]
        if t_flag_targets[self.send(ship)[t]]
          t_flag_targets[self.send(ship)[t]] = add_ship_to_flag_array(t_flag_targets[self.send(ship)[t]], self.send(ship))
        else
          t_flag_targets[t] = self.send(ship)
        end
      end
    end
    return l_flag_targets, c_flag_targets, t_flag_targets
  end


  def add_ship_to_flag_array(array, ship)
    updated_array = []
    begin
      if array.class == Array
        updated_array = array << ship
      elsif array.class == Hash
        updated_array << array
        updated_array << ship
      end
      return updated_array
    rescue StandardError => e
      puts e.message
    end
  end

  SLOOP = <<-HEREDOC
                      |    |    |
                     )_)  )_)  )_)
                    )___))___))___)\\
                   )____)____)_____)\\
                 _____|____|____|____\\\__
        ---------\\                   /---------
          ^^^^^ ^^^^^^^^^^^^^^^^^^^^^
             ^^^^      ^^^^     ^^^    ^^
                   ^^^^      ^^^
  HEREDOC
  @sloop = {
    'type'          => 'seaship',
    'class'         => 'unknown',
    'name'          => 'USS Enterprise',
    'registration'  => 'unknown',
    'captain'       => nil,
    'blueprint'     => SLOOP,
    'l-flag'        => 'rev',
    'c-flag'        => nil,
    't-flag'        => 'sea'
  }
  attr_reader :sloop

  CARRIER = <<-HEREDOC
                       |
                      -+-
                    ---#---
                    __|_|__            __
                    \\_____/           ||\\________
      __   __   __  \\_____/            ^---------^
      ||\\__||\\__||\\__|___  | '-O-`
      -^---------^--^----^___.-------------.___.--------.___.------
      `-------------|-------------------------------|-------------'
      \\___      |     \\    o O o   /     |      ___/
         \\____/        \\         /        \\____/
             |           \\     /           |
             |             \\|/             |
             |              |              |
  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  HEREDOC
  @carrier = {
    'type'          => 'seaship',
    'class'         => 'Nimitz',
    'name'          => 'USS Enterprise',
    'registration'  => 'CVN-65',
    'captain'       => 'Vincent Paul DePoix',
    'blueprint'     => CARRIER,
    'l-flag'        => 'cvn',
    'c-flag'        => 'depoix',
    't-flag'        => 'sea'
  }
  attr_reader :carrier

  SPACESHUTTLE = <<-HEREDOC
                   _________
                  (=========)
                  |=========|
                  |====_====|
                  |== / \\ ==|
                  |= / _ \\ =|
               _  |=| ( ) |=|  _
              /=\\ |=|     |=| /=\\
              |=| |=| USA |=| |=|
              |=| |=|  _  |=| |=|
              |=| |=| | | |=| |=|
              |=| |=| | | |=| |=|
              |=| |=| | | |=| |=|
              |=| |/  | |  \\| |=|
              |=|/    | |    \\|=|
              |=/NASA |_| NASA\\=|
              |(_______________)|
              |=| |_|__|__|_| |=|
              |=|   ( ) ( )   |=|
             /===\\----------/===\\
            |||||||         |||||||
            -------         -------
             (~~~)           (~~~)
              (~)             (~)
               *               *
  HEREDOC
  @spaceshuttle = {
    'type'          => 'orbital vehicle',
    'class'         => 'unknown',
    'name'          => 'Space Shuttle Enterprise',
    'registration'  => 'OV-101',
    'captain'       => 'Fred Haise',
    'blueprint' => SPACESHUTTLE,
    'l-flag'        => 'ov',
    'c-flag'        => 'haise',
    't-flag'        => 'orbital'
  }
  attr_reader :spaceshuttle

  SS_NX = <<-HEREDOC
                        ___
    ,.-"---------''''''''''''''| : `.                       __
     \() (===== ====== ======) |-+-- )                __.--'--`.___
      `.---------..............|_:_.'     ___...---'''____.....----:::--.._
                     `.  + \\        __o./   __..--'''      """            ''-.
                       `._+_\\_..--'' -----='----+-------------------------+---`--.
                       <___ `______________|_____\__'''''''""'''''''';...----'''''`
                           ""                    `" '--.__ __ __.--''
                                                           `--'
  HEREDOC
  @ss_nx = {
    'type'          => 'starship',
    'class'         => 'NX',
    'name'          => 'USS Enterprise',
    'registration'  => 'NX-01',
    'captain'       => 'Jonathan Archer',
    'blueprint'     => SS_NX,
    'l-flag'        => 'nx',
    'c-flag'        => 'archer',
    't-flag'        => 'star'
  }
  attr_reader :ss_nx

  SS_CONSTITUTION = <<-HEREDOC
                                           _  ___________________________=====____
                    __--__                / ||     =<==== NCC-1701 =======       /
      ___________---______---___________  \\_||__________________________________/
      \\________________________________/           | |
                   \\______/  \\__ .. :  \\           | |
                     `--'       \\_   :  \\          | |
                               __-`------`-----____| |
                            \\ |||_     .::. :      |_|--_
                            -)=|__ =<=======--      :. |_\\
                            / |||           __________---'
                                ------------
  HEREDOC
  @ss_constitution ={
    'type'          => 'starship',
    'class'         => 'constitution',
    'name'          => 'USS Enterprise',
    'registration'  => 'NCC-1701',
    'captain'       => 'James T. Kirk',
    'blueprint'     => SS_CONSTITUTION,
    'l-flag'        => nil,
    'c-flag'        => 'kirk',
    't-flag'        => 'star'
  }
  attr_reader :ss_constitution

  SS_CONST_REFIT = <<-HEREDOC
        ___________________          _-_
        \\__(==========/_=_/ ____.---'---`---.____
                    \\_ \\    \\----._________.----/
                      \\ \\   /  /    `-_-'
                  __,--`.`-'..'-_
                 /____          ||
                      `--.____,-'
  HEREDOC
  @ss_const_refit = {
    'type'          => 'starship',
    'class'         => 'constitution - refit',
    'name'          => 'USS Enterprise',
    'registration'  => 'NCC-1701-A',
    'captain'       => 'James T. Kirk',
    'blueprint'     => SS_CONST_REFIT,
    'l-flag'        => 'a',
    'c-flag'        => 'kirk',
    't-flag'        => 'star'
  }
  attr_reader :ss_const_refit

  SS_EXCELSIOR = <<-HEREDOC
    .-----.__________________________.------.   ___.--.__________.--._
    =========================================   `\\_  ____.------'-----`-----.____
    `------------------------._____.--------'     [================================
                _____    _.-|   |---.__          |=========|  `-----'
             .-|||   `--'---|___|------`--------'----------|
             '--------------------._     ------==== O>    /
                                    `-.                  /
                                       \\            __.-'
                                        \\____.-----'
  HEREDOC
  @ss_excelsior = {
    'type'          => 'starship',
    'class'         => 'excelsior',
    'name'          => 'USS Excelsior',
    'registration'  => 'NCC-2000',
    'captain'       => 'Hikaru Sulu',
    'blueprint'     => SS_EXCELSIOR,
    'l-flag'        => 'exc',
    'c-flag'        => 'sulu',
    't-flag'        => 'star'
  }
  attr_reader :ss_excelsior
  @ss_enterprise_b = {
    'type'          => 'starship',
    'class'         => 'excelsior',
    'name'          => 'USS Enterprise',
    'registration'  => 'NCC-1701-B',
    'captain'       => 'Cameron from Ferris Beuller',
    'blueprint'     => SS_EXCELSIOR,
    'l-flag'        => 'b',
    'c-flag'        => 'cam',
    't-flag'        => 'star'
  }
  attr_reader :ss_enterprise_b

  SS_AMBASSADOR = <<-HEREDOC
                                    ________
                             ___---'--------`--..____
      ,-------------------.============================
      (__________________<|_)   `--.._______..--'
            |   |   ___,--' - _  /
         ,--'   `--'            |
         ~~~~~~~`-._            |
                     `-.______,-'
  HEREDOC
  @ss_ambassador = {
    'type'          => 'starship',
    'class'         => 'ambassador',
    'name'          => 'USS Enterprise',
    'registration'  => 'NCC-1701-C',
    'captain'       => 'Rachel Garrett',
    'blueprint'     => SS_AMBASSADOR,
    'l-flag'        => 'c',
    'c-flag'        => 'garrett',
    't-flag'        => 'star'
  }
  attr_reader :ss_ambassador

  SS_GALAXY = <<-HEREDOC
                                                        ______
                                           ___.--------'------`---------.____
                                     _.---'----------------------------------`---.__
                                   .'___=]===========================================
      ,-----------------------..__/.'         >--.______        _______.---'
      ]====================<==||(__)        .'          `------'
      `-----------------------`' ----.___--/
           /       /---'                 `/
          /_______(______________________/
          `-------------.--------------.'
                          \\________|_.-'
  HEREDOC
  @ss_galaxy = {
    'type'          => 'starship',
    'class'         => 'galaxy',
    'name'          => 'USS Enterprise',
    'registration'  => 'NCC-1701-D',
    'captain'       => 'Jean-Luc Picard',
    'blueprint'     => SS_GALAXY,
    'l-flag'        => 'd',
    'c-flag'        => 'picard',
    't-flag'        => 'star'
  }
  attr_reader :ss_galaxy

  SS_SOVEREIGN = <<-HEREDOC
     _____________________________,----,__
    |==============================<| /___\\              ____,-------------.____
     `------------------.-----.---.___.--'          __.--'-----------------------`--.__
                         `._   `.            =============================================
                       ____`.___`._____,----'     `--------,----------------'
                      /_|___________-----<       ========,'
                                    `-.                ,'
                                       `----.______,--'
  HEREDOC
  @ss_sovereign = {
    'type'          => 'starship',
    'class'         => 'sovereign',
    'name'          => 'USS Enterprise',
    'registration'  => 'NCC-1701-E',
    'captain'       => 'Jean-Luc Picard',
    'blueprint'     => SS_SOVEREIGN,
    'l-flag'        => 'e',
    'c-flag'        => 'picard',
    't-flag'        => 'star'
  }
  attr_reader :ss_sovereign

  SS_INTREPID = <<-HEREDOC
                                                         __
                                                    _.-~`  `~-.
                        _.--~~~---,.__          _.,;; .   -=(@'`\\
                     .-`              ``~~~~--~~` ';;;       ____)
                  _.'            '.              ';;;;;    '`_.'
               .-~;`               `\\           ' ';;;;;__.~`
             .' .'          `'.     |           /  /;''
              \\/      .---'''``)   /'-._____.--'\\  \\
             _/|    (`        /  /`              `\\ \\__
      ',    `/- \\   \\      __/  (_                /-\\-\\-`
      `;'-..___)   |     `/-\\-\\-`
       `-.       .'
          `~~~~``

    Never watch Threshold.
  HEREDOC
  @ss_intrepid = {
    'type'          => 'starship',
    'class'         => 'intrepid',
    'name'          => 'USS Voyager',
    'registration'  => 'NCC-74656',
    'captain'       => 'Kathryn Janeway',
    'blueprint'     => SS_INTREPID,
    'l-flag'        => 'voy',
    'c-flag'        => 'janeway',
    't-flag'        => 'star'
  }
  attr_reader :ss_intrepid
end
