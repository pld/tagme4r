require 'test/unit'
require 'tagme'

# for tests to pass you must provide an API key
API_KEY = '[API KEY]'

TEST_STR ='On this day 24 years ago Maradona scored his infamous &quot;Hand of God&quot; goal against England in the quarter-final of the 1986'

class TagmeTest < Test::Unit::TestCase
  def test_set_key
    e = Tagme.new(API_KEY)
    assert_equal API_KEY, e.api_key
  end

  # requires internet connectivity
  def test_get_search_response
    e = Tagme.new(API_KEY)
    assert_equal false, e.tag(TEST_STR).empty?
  end
end
