require "bundler/gem_tasks"

require "spec/rake/spectask"
Bundler::GemHelper.install_tasks

desc "Run all specs in spec directory"
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = FileList["spec/*_spec.rb"]
end

task :default => :spec
