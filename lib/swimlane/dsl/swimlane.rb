# Autogenerated from a Treetop grammar. Edits may be lost.


require 'treetop'

module DSL
  module SwimLane
    include Treetop::Runtime

  end

  class SwimLaneParser < Treetop::Runtime::CompiledParser
    include SwimLane
  end

end