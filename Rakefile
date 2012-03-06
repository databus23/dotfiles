require 'rake'
require 'erb'
require 'yaml'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile mapping.yml].include? file
    dest = map(file)
    if File.exist?(File.expand_path dest)
      if File.identical? file, File.expand_path(dest)
        puts "identical #{dest}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite #{dest}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping #{dest}"
        end
      end
    else
      link_file(file)
    end
  end
end

def map(file)
  @mapping ||= YAML::load('mapping.yml')
  m = '.#filename#'
  m = @mapping[file] if @mapping[file]
  File.join('~', m.gsub(/#filename#/, file))
end

def replace_file(file)
  system %Q{rm -rf #{map(file)}}
  link_file(file)
end

def link_file(file)
  dest = map file
  if file =~ /.erb$/
    puts "generating #{dest}))"
    File.open(File.join(ENV['HOME'], dest, 'w')) do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking #{dest}"
    system %Q{ln -s "$PWD/#{file}" #{dest}}
  end
end
