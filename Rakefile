# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'rubygems'
require 'motion-cocoapods'
require 'motion-settings-bundle'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'Shorti Channel'

  app.info_plist['UIViewControllerBasedStatusBarAppearance'] = false

  app.pods do
    pod 'AFNetworking'
    pod 'AsyncImageView'
    pod 'MBProgressHUD', '~> 0.8'
  end
end

Motion::SettingsBundle.setup do |app|
  app.multivalue 'Channel', key: 'channel', default: 'dGtvt0Y', values: ['dGtvt0Y', 'sekFgXs', 'InVaLiD'], titles: ['Daily', 'True Explorers', 'Invalid']
end
