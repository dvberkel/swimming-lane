require "rubygems"
require "bundler/setup"

require "swimlane"

module DSLSpec
  describe "DSL for swimming lanes" do
    before(:all) do
      @parser = DSL::SwimLaneParser.new
    end

    it "should provide a parser'" do
      @parser.should_not == nil
    end
  end
end
