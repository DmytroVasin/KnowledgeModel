# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'rubygems'
require 'motion-pixatefreestyle'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Ruby Knowledge Test'
  app.version = '0.1.0'

  # app.interface_orientations = [:portrait]

  app.icons = [
    'icons/j-way-icon-iphone.png',
    'icons/j-way-icon-iphone-retina.png',
    'icons/j-way-icon-ipad.png',
    'icons/j-way-icon-ipad-retina.png'
  ]
  app.prerendered_icon = true
  app.device_family = [:iphone, :ipad]

  app.pixatefreestyle.framework = 'vendor/PixateFreestyle.framework'

  app.libs += ['/usr/lib/libz.dylib', '/usr/lib/libsqlite3.dylib']
  app.include 'sqlite3.h'
end
