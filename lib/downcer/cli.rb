require 'yaml'
require 'uri'

module Downcer
  CONFIG = "#{ENV['HOME']}/.downcerrc"

  class CLI
    def self.start(*args)
      self.new(args.first).download
    end

    def initialize(url)
      @url = URI.parse(URI.encode(url))
      @config = get_config(@url)
    rescue URI::InvalidURIError => e
      abort 'Usage: downcer <url>'
    rescue SystemCallError => e
      abort e.to_s
    end

    def download
      puts "Use `#{@config['command']}`"
      puts '--'
      exec "#{@config['command']} #{@config['option']} '#{@url}'"
    end

    private
      def get_config(url)
        domain = url.host
        yaml = YAML.load_file(CONFIG)
        config = yaml.select { |host, v| domain.match(/#{host}/) }.values.first
        config || yaml['default'] || { 'command' => 'curl', 'option' => '-LO' }
      rescue Exception => e
        abort e.to_s
      end
  end
end
