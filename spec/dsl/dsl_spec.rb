require "rubygems"
require "bundler/setup"

require "swimlane"

module DSLSpec
  describe "DSL for swimming lanes" do
    before(:all) do
      @parser = DSL::SwimLaneParser.new
    end

    it "should provide a parser" do
      @parser.should_not == nil
    end

    it "should succesfully parse 'diagram'" do
      @parser.parse("diagram").should_not == nil
    end

    it "should succesfully parse '\\n\\tdiagram \\n'" do
      @parser.parse("\n\tdiagram \n").should_not == nil
    end
  end
end
