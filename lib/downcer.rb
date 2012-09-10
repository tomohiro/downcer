require 'downcer/version'
require 'yaml'
require 'uri'

module Downcer
  class CLI
    def self.start(*args)
      self.new(args.first).download
    end

    def initialize(url)
      @url = URI.parse(url)
      @config = YAML.load_file("#{ENV['HOME']}/.downcerrc")
    rescue URI::InvalidURIError => e
      abort 'Usage: downcer <url>'
    rescue SystemCallError => e
      abort e.to_s
    end

    def download
      command, option = get_command
      system("#{command} #{option} '#{@url}'")
    end

    private
      def get_command
        site = @config[@url.host] || @config['default']
        return ['wget', ''] if site.nil?

        [site['command'], site['option']]
      end
  end
end
