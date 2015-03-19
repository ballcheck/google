require_relative "./google_search"
require_relative "./fetcher"

# --------------------
# Example usage (working under Ruby 2.1.2 with RVM and Bundler)
# 
# To fetch the page found as the first result of searching google for "which university"...
# 
# > ReallyUseful.really_useful_method
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
end
