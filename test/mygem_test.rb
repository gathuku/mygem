require "test_helper"

class MygemTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Mygem::VERSION
  end

  def test_it_does_something_useful
    assert true
  end

  def test_it_return_ip
    stub_request(:get, "https://jsonip.org/").

    to_return(status: 200, body:'{"ip":"154.70.39.153","about":"/about"}', headers: {})

    assert_equal "154.70.39.153", Mygem.jsonip
  end
end
