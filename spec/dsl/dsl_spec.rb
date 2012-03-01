require "rubygems"
require "bundler/setup"

require "swimlane"

module DSLSpec
  describe "DSL for swimming lanes" do
    it "should provide a parser'" do
      parser = DSL::SwimLaneParser.new
      
      parser.should_not == nil
    end
  end
end
