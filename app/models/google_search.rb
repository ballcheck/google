# We could use googles api directly but we are time limited
# and a convenient gem is available.
require "google-search"

# This is only really here so we are not coupled to 
# the google-search gem.
class GoogleSearch

  class ResponseError < StandardError
  end

  class NoItemError < StandardError
  end

  def self.search_web( query )
    search = Google::Search::Web.new( :query => query )
    response = search.response

    raise ResponseError.new( response.status ) unless response.valid?

    return search
  end

  def self.get_first_item( query )
    search = search_web( query )

    # FIXME: Google::Search::Web#first is a method mixed in from Enumerable.
    # It does not return the first result. Instead it appears to enumerate
    # over the items.
    
    # The above call to Google::Search::Web#response on line 17 appears to
    # move the enumerator forward one step resulting in the 2nd item being
    # assigned.
    item = search.first

    raise NoItemError unless item

    return item
  end

end
