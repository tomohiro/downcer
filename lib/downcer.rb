require 'downcer/version'
require 'yaml'
require 'uri'

module Downcer
  class CLI
    def self.start(*args)
      self.new(args.first).download
    end

    def initialize(url)
      @url = url
      @config = YAML.load_file("#{ENV['HOME']}/.downcerrc")
    end

    def download
      command, option = get_command
      system("#{command} #{option} '#{@url}'")
    end

    private
      def get_command
        host = URI.parse(@url).host
        site = @config[host] || @config['default']
        return ['wget', ''] if site.nil?

        [site['command'], site['option']]
      end
  end
end
