begin
  require 'cane/rake_task'

  desc "Run cane to check quality metrics"
  Cane::RakeTask.new(:quality) do |cane|
    cane.abc_glob        = './{app,lib/xingishere}/**/*.rb'
    cane.abc_max         = 25
    cane.no_doc          = true
    cane.style_glob      = './{app,lib/xingishere}/**/*.rb'
    cane.style_measure   = 120
    cane.abc_exclude     = %w(
    )
    cane.style_exclude   = []
    cane.options[:color] = true
  end
rescue LoadError
  warn "cane not available, quality task not provided."
end
