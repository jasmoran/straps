require 'json'

File.open('fs.js', 'w') do |f|
  f.write('const files = ')
  f.write(JSON.generate(Dir['src/**/*.v10'].each_with_object({}) do |path, ob|
    next unless File.file? path
    ob[path] = File.read(path)
  end))
end