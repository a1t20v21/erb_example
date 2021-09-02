require 'erb'
require 'yaml'

template = File.open('template.erb', 'rb', &:read)
config = YAML.load_file('config.yaml')
config['filebeat_paths'].each do |key, value|
    @files_path = value
    renderer = ERB.new(template)
    puts output = renderer.result(binding)
end
