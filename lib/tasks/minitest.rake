Rails::TestTask.new("test:features" => "test:prepare") do |t|
  t.pattern = "test/features/**/*_test.rb"
end

Rake::Task["test:run"].enhance ["test:features"]
# comment this out if you don't want feature tests to run
# when running rake; it is difficult to tie into spring
