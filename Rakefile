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
  @mapping ||= YAML::load(File.open('mapping.yml'))
  m = '.#filename#'
  m = @mapping[file] if @mapping[file]
  File.join('~', m.gsub(/#filename#/, file).gsub(/\.erb$/,''))
end

def replace_file(file)
  system %Q{rm -rf #{map(file)}}
  link_file(file)
end

def link_file(file)
  dest = map file
  if file =~ /.erb$/
    puts "generating #{dest}"
    dest_expanded = File.expand_path dest 
    File.open(dest_expanded, 'w') do |new_file|
      new_file.write ERB.new(File.read(file),nil,'<>').result(binding)
      local_file = "#{dest_expanded}.local"
      new_file.write File.read(local_file) if File.exists? local_file
    end
  else
    puts "linking #{dest}"
    system %Q{ln -s "$PWD/#{file}" #{dest}}
  end
end
