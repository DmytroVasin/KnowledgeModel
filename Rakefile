# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'rubygems'
require 'motion-pixatefreestyle'
require './resources/app_properties'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  properties = AppProperties.new

  app.name             = properties.name
  app.icons            = properties.icons
  app.identifier       = properties.identifier
  app.prerendered_icon = properties.prerendered_icon
  app.device_family    = properties.devices

  app.pixatefreestyle.framework = 'vendor/PixateFreestyle.framework'

  app.libs += properties.libraries
  app.include 'sqlite3.h'

  app.development do
    p 'Setting development options...'

    app.version              = properties.dev_version
    app.codesign_certificate = properties.dev_certificate
    app.provisioning_profile = properties.dev_profile_path
  end

  app.release do
    p 'Setting release options...'

    app.version              = properties.version
    app.codesign_certificate = properties.release_certificate
    app.provisioning_profile = properties.release_profile_path
  end
end
