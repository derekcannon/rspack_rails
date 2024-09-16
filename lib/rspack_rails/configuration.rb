# frozen_string_literal: true

module RspackRails
  class Configuration
    attr_accessor :use_dev_server, :dev_server_host, :dev_server_port

    def initialize
      @use_dev_server = false
      @dev_server_host = 'localhost'
      @dev_server_port = 3035
    end

    def dev_server_url
      "http://#{@dev_server_host}:#{@dev_server_port}/packs"
    end
  end
end
