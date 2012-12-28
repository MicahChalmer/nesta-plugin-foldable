require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'nesta/env'
Nesta::Env.root = File.expand_path('./foldable-plugin-test-nesta-site', File.dirname(__FILE__))

# Nesta requires the current dir to be the root
Dir.chdir(Nesta::Env.root)

require 'nesta/plugin'
require 'nesta-plugin-foldable'
require 'nesta/app'

describe "Foldable plugin" do
  it "should have no summary if there is neither fold nor meta" do
    page = Nesta::Page.find_by_path("testnofoldnometa")
    page.summary.should be_nil
  end

  it "should use the fold if it's there" do
    page = Nesta::Page.find_by_path("testwithfold")
    page.summary.should include("In the summary")
    page.summary.should_not include("Out of the summary")
  end

  it "should not use the fold if the summary is defined in metadata" do
    page = Nesta::Page.find_by_path("testfoldandmeta")
    page.summary.should include("Meta summary")
    page.summary.should_not include("Not in the summary")
  end

  it "should should still pickup a summary defined in metadata with no fold" do
    page = Nesta::Page.find_by_path("testnofoldmeta")
    page.summary.should include("Meta summary")
    page.summary.should_not include("In the body")
  end

end
