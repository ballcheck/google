require 'test/unit'
require 'mocha/setup'
require 'debugger'
require 'tmpdir'
require 'benchmark'

require_relative "./test_case"

# requiring source files...
require_relative "./factories"
require_relative "../app/models/fetcher"
require_relative "../app/models/google_search"
require_relative "../app/models/really_useful"

include Factories
