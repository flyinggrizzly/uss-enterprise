require 'test/unit'
require 'uss-enterprise/ship_options.rb'

# Test the methods in module ShipOptions
# Not going to test the ASCII art... yet
class TestShipOptions < Test::Unit::TestCase

  def setup
    @shipper = Object.new
    @shipper.extend(ShipOptions)
  end

  def test_add_ship_to_flag_array
    # test case in which we pass in array
    expectation = [1, 2, 3]
    evaluation = @shipper.add_ship_to_flag_array([1, 2], 3)

    assert_equal(expectation, evaluation)

    # test case in which we pass in a Hash
    hash_foo    = {'foo'   => 'bar',
                   'baz'   => 'goof'}
    hash_sesame = {'elmo'  => 'cute',
                   'oscar' => 'gross'}

    expectation = [hash_foo, hash_sesame]
    evaluation = @shipper.add_ship_to_flag_array(hash_foo, hash_sesame)

    assert_equal(expectation, evaluation)

    # TODO: error handling assertion
  end

  def test_extract_cli_flags

    l_flags = ['rev', 'cvn', 'ov', 'nx', 'a', 'b', 'exc', 'c', 'd', 'e', 'voy'].sort!
    c_flags = ['depoix', 'haise', 'archer', 'kirk', 'sulu', 'cam', 'garrett', 'picard', 'janeway']
    t_flags = ['sea', 'orbital', 'star']

    expectation = [l_flags.sort, c_flags.sort!, t_flags.sort!]
    l_recvd, c_recvd, t_recvd = @shipper.extract_cli_flags

    assert_equal(expectation, [l_recvd.keys.sort, c_recvd.keys.sort, t_recvd.keys.sort])
  end

end
