# TODO: proxy?
# TODO: handle socket errors.
require "open-uri"

module Fetcher

  def fetch_document( uri )
    begin
      tempfile = open( uri )
    rescue OpenURI::HTTPError => e
      http_error_handler( e )
    else
      return tempfile.read
    end
  end

  private

  def http_error_handler( error )
    # place holder method - in the real world we would do something
    # useful with this error.

    # swallow error (gulp!)
  end
end
