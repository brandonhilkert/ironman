require 'bundler'
Bundler.require

module Project
  def self.root
    @root ||= Pathname(File.expand_path("../..", __FILE__))
  end

  def self.env
    @env ||= (ENV["RACK_ENV"] || "development")
  end
end

require_relative 'project/app'
