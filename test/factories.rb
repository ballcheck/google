module Factories

  def given_a_random_string( length = 10 )
    SecureRandom.urlsafe_base64( length )
  end

  def given_a_google_search_web
    Google::Search::Web.new
  end

  def given_a_google_search_response( params = {} )
    Google::Search::Response.new( params )
  end

  def given_a_google_search_item( params = {} )
    Google::Search::Item.new( params )
  end

  # TODO: we need a better way of writing factories without stubbing everything
  def given_a_stubbed_search_web( valid = true )
    response = given_a_google_search_response
    response.stubs( :valid? ).returns( valid )

    search = given_a_google_search_web
    search.stubs( :response ).returns( response )

    item = given_a_google_search_item
    search.stubs( :first ).returns( item )

    return search
  end

end
