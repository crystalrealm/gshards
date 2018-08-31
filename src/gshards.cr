require "bargs"
require "yaml"

module GShards
  GSHARDS_PATH = "#{ENV["HOME"]}/.gshards/"
  interface = Bargs::CLI.new
  interface.help = "Help message goes here."
  interface.command "install"

  if !Dir.exists?(GSHARDS_PATH)
    Dir.mkdir(GSHARDS_PATH)
    Dir.cd(GSHARDS_PATH)
    Process.exec("shards", ["init"])
  end

  args = interface.process
  if args.command_name == "install"
    yaml_repr = YAML.parse(File.read("#{GSHARDS_PATH}shard.yml"))
  end
end
