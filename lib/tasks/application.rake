task all_specs: :environment do
  Rake::Task['quality'].invoke
  Rake::Task['rubocop'].invoke
  Rake::Task['brakeman:run'].invoke
  Rake::Task['spec'].invoke
end

task default: :all_specs
