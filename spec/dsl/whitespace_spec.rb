require "rubygems"
require "bundler/setup"

require "whitespace"

module WhiteSpaceSpec
  describe "Whitespace grammer" do
    before(:all) do
      @parser = DSL::WhitespaceParser.new
    end

    it "should provide a parser" do
      @parser.should_not == nil
    end

    it "should parse a single whitespace ' '" do
      @parser.parse(' ')
    end
  end
end
