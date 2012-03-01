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

    it "should parse a single space ' '" do
      @parser.parse(" ").should_not == nil
    end

    it "should parse a single tab '\\t'" do
      @parser.parse("\t").should_not == nil
    end

    it "should parse a single newline '\\n'" do
      @parser.parse("\n").should_not == nil
    end

    it "should parse a multiple spaces ' '" do
      @parser.parse("  ").should_not == nil
    end

    it "should parse a multiple tabs '\\t'" do
      @parser.parse("\t\t").should_not == nil
    end

    it "should parse a multiple newlines '\\n'" do
      @parser.parse("\n\n").should_not == nil
    end

    it "should parse any combination of whitespace" do
      @parser.parse("  \t\t \n\t\n\n ").should_not == nil
    end
  end
end
