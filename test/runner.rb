require_relative "./test_helper"
Dir.glob( File.expand_path( "../unit/*_test.rb", __FILE__ ), &method( :load ) )
