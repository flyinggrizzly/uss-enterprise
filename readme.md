# USS Enterprise

*These are the voyages...*

```
--------------------------     ________________        _
-----------------------------  \__(=======/_=_/____.--'-`--.___
---------------------------              \ \   `,--,-.___.----'
-----------------------                .--`\\--'../
-------------------                   '---._____.|]
```


This gem exposes an executable on the commandline that outputs ASCII art of a ship that bore the name "U.S.S. Enterprise".

## Installation

`gem install uss-enterprise`

## Usage

`$ enterprise` outputs a random Enterprise.

You can also supply the `-l` flag, followed by an argument to specify a specific enterprise.

Acceptable arguments produce the following ships:

- `rev  # => U.S.S Enterprise (1775) - US Navy sloop during the American Revolution`
- `cvn  # => U.S.S. Enterprise CVN-65 - Nimitz class aircraft carrier`
- `ov   # => Enterprise O.V.-101 - Test unit spaceshuttle`
- `nx   # => Enterprise NX-01`
- `none # => Enterprise NCC-1701`
- `a    # => Enterprise NCC-1701-A`
- `b    # => Enterprise NCC-1701-B`
- `c    # => Enterprise NCC-1701-C`
- `d    # => Enterprise NCC-1701-D`
- `e    # => Enterprise NCC-1701-E`
- `voy  # => Voyager NCC-74656`

Incorrect parameters cause it to supply usage instructions.

## Recommended usage

Append `enterprise [-l] [arg]` to your `.bash_profile` or `.zshrc` or whatever so you are greeted with an awesome ship every time you load the terminal.

## Test coverage

Isn't perfect. The major stuff that happens behind the scenes has tests to cover it, but the more transparent methods and classes (i.e. the ones that handle/parse the arguments) don't.

Should probably do a major refactor and reorganization of the way the thing works instead of trying to write tests to cover this, because it won't be easy and the control flow could probably be simplified anyways.


### Sources for ASCII art

- [Sloop (1775)](http://www.ascii-code.com/ascii-art/vehicles/boats.php)
- [Aircraft carrier](http://carrier.ascii.uk/)
- [Spaceshuttle](http://www.ascii-code.com/ascii-art/space/spaceships.php)
- [NX class](https://startrekasciiart.blogspot.co.uk/2011/05/nx-class.html)
- [Constitution class](https://startrekasciiart.blogspot.co.uk/2011/06/constitution-class.html)
- [Constitution refit](https://startrekasciiart.blogspot.co.uk/2011/06/constitution-class-refit.html)
- [Excelsior class](https://startrekasciiart.blogspot.co.uk/2011/05/excelsior-class.html)
- [Ambassador class](https://startrekasciiart.blogspot.co.uk/2011/06/ambassador-class.html)
- [Galaxy class](https://startrekasciiart.blogspot.co.uk/2011/05/galaxy-class.html)
- [Sovereign class](https://startrekasciiart.blogspot.co.uk/2011/05/sovereign-class.html)
