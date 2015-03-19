require_relative "../test_helper"

class GoogleSearchTest < TestCase
  # Better than nothing but not really testing much as it's so heavily stubbed.
  def test_search_web_hits_gem
    # Given
    query = given_a_random_string
    expected_params = { :query => query }

    # expect the gem method is called with correct params
    stubbed_search = given_a_stubbed_search_web( true )
    Google::Search::Web.expects( :new ).with( expected_params ).returns( stubbed_search )

    # When
    search = GoogleSearch.search_web( query )
    
    # Then
    assert_equal stubbed_search, search
  end

  def test_search_web_raises_response_error
    # Given
    query = given_a_random_string

    # we can't hit google in tests so stub it out the best we can
    search = given_a_stubbed_search_web( false )
    Google::Search::Web.stubs( :new ).returns( search )

    # When / # Then
    assert_raise GoogleSearch::ResponseError do
      GoogleSearch.search_web( query )
    end
  end

  def test_get_first_item
    # Given
    query = given_a_random_string
    expected_params = { :query => query }

    stubbed_search = given_a_stubbed_search_web( true )
    Google::Search::Web.stubs( :new ).returns( stubbed_search )

    stubbed_item = given_a_google_search_item
    stubbed_search.expects( :first ).returns( stubbed_item )

    # When
    item = GoogleSearch.get_first_item( query )

    # Then
    assert_equal stubbed_item, item
  end

  def test_get_first_item_raises_no_item_error
    # Given
    query = given_a_random_string
    expected_params = { :query => query }

    stubbed_search = given_a_stubbed_search_web( true )
    Google::Search::Web.stubs( :new ).returns( stubbed_search )

    stubbed_search.expects( :first ).returns( nil )

    # When / # Then
    assert_raise GoogleSearch::NoItemError do
      item = GoogleSearch.get_first_item( query )
    end
  end

end
