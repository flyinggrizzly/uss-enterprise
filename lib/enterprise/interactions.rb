module UserInput

  def prompt
    print "> "
    response = $stdin.gets.chomp
    return response
  end

  def define_cli_flags
    @flags = {
      '-c' => "ship class",
      '-t' => "ship type (starship, seaship, orbitalship)",
      '-C' => "captain",
      '-i' => "interactive",
      '-r' => "random",
      '-n' => "number (of ships)"
    }
    @flags
  end
end
