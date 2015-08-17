PROJECT_CEEDLING_ROOT = "vendor/ceedling"
load "#{PROJECT_CEEDLING_ROOT}/lib/ceedling.rb"
load "FlashProgrammer.rb"

Ceedling.load_project

task :default => %w[ test:all release ]
