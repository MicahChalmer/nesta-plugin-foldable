require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'nesta/env'
require 'ruby-debug'
Nesta::Env.root = File.expand_path('./foldable-plugin-test-nesta-site', File.dirname(__FILE__))

# Nesta requires the current dir to be the root
Dir.chdir(Nesta::Env.root)

require 'nesta/plugin'
require 'nesta-plugin-foldable'
require 'nesta/app'

describe "Foldable plugin" do
  it "should use the fold if it's there" do
    page = Nesta::Page.find_by_path("testwithfold")
    page.summary.should include("In the summary")
    page.summary.should_not include("Out of the summary")
  end
end
