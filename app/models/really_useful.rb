require_relative "./google_search"
require_relative "./fetcher"

# --------------------
# Example usage (working under Ruby 2.1.2 with RVM and Bundler)
# 
# You can run the few completed tests with:
#
# > bundle exec ruby test/runner.rb
#
# To fetch the page found as the first result of searching google for "which university"...
# 
# > ReallyUseful.really_useful_method
#
# NOTE: There is a bug where the wrong item is returned. See #ReallyUseful for details.
# --------------------

class ReallyUseful

  extend Fetcher

  def self.really_useful_method
    # get the first search result from google
    query = "which university"
    item = GoogleSearch.get_first_item( query )

    # I presume by "click" on the first link we mean fetch the document itself
    return fetch_document( item.uri )
  end

  def self.really_useful_method2( n )
    # get the nth search result from google
    query = "which university"
    item = GoogleSearch.get_nth_item( query, n )

    fetched_document = fetch_document( item.uri )
    return { :uri => item.uri, :body => fetched_document }
  end
end
