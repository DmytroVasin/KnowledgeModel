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
    'icons/icon_iphone.png',
    'icons/icon_iphone_retina.png',
    'icons/icon_ipad.png',
    'icons/icon_ipad_retina.png'
  ]
  app.prerendered_icon = true
  app.device_family = [:iphone, :ipad]


  app.frameworks += [ 'CoreData' ]

  app.pixatefreestyle.framework = 'vendor/PixateFreestyle.framework'
  app.fonts = ["Inconsolata.ttf"]
end

# task :"build:simulator" => :"schema:build"
