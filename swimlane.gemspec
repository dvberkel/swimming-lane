Gem::Specification.new do |spec|
  spec.name = "swimlane"
  spec.platform = Gem::Platform::RUBY
  spec.version = "0.0.1"
  spec.authors = ['Daan van Berkel']
  spec.email = ['daan.v.berkel.1980@gmail.com']
  spec.homepage = "https://github.com/dvberkel/swimming-lane"
  spec.summary = "Swim Lane Diagram Editor"
  spec.description = <<-DESCRIPTION
    swimlane allows a user to specify a swim lane diagram in a domain
    specific language and generate render a visual representation from it.
  DESCRIPTION

  spec.add_dependency "bundler"
  spec.add_dependency "rake"
  spec.add_dependency "rspec"
  spec.add_dependency "travis-lint"

  spec.files = `git ls-files`.split("\n")
  spec.require_path = 'lib'
end