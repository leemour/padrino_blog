# encoding: utf-8
Padrino.before_load do
  #Encoding.default_internal = nil
  # Encoding.default_external = 'ASCII-8BIT'
end

# this makes haml to treat templates as properly encoded (respect Encoding.default_external)
module Tilt
  class HamlTemplate
    def prepare
      @data.force_encoding Encoding.default_external
      options = @options.merge(:filename => eval_file, :line => line)
      @engine = ::Haml::Engine.new(data, options)
    end
  end
  class CoffeeScriptTemplate
    def prepare
      @data.force_encoding Encoding.default_external
      if !options.key?(:bare) and !options.key?(:no_wrap)
        options[:bare] = self.class.default_bare
      end
    end
  end
end



##
# This file mounts each app in the Padrino project to a specified sub-uri.
# You can mount additional applications using any of these commands below:
#
#   Padrino.mount('blog').to('/blog')
#   Padrino.mount('blog', :app_class => 'BlogApp').to('/blog')
#   Padrino.mount('blog', :app_file =>  'path/to/blog/app.rb').to('/blog')
#
# You can also map apps to a specified host:
#
#   Padrino.mount('Admin').host('admin.example.org')
#   Padrino.mount('WebSite').host(/.*\.?example.org/)
#   Padrino.mount('Foo').to('/foo').host('bar.example.org')
#
# Note 1: Mounted apps (by default) should be placed into the project root at '/app_name'.
# Note 2: If you use the host matching remember to respect the order of the rules.
#
# By default, this file mounts the primary app which was generated with this project.
# However, the mounted app can be modified as needed:
#
#   Padrino.mount('AppName', :app_file => 'path/to/file', :app_class => 'BlogApp').to('/')
#

##
# Setup global project settings for your apps. These settings are inherited by every subapp. You can
# override these settings in the subapps as needed.
#
Padrino.configure_apps do
  # enable :sessions
  set :session_secret, '23c8d9628969b634fcbe917dbd67b18d6de664c656c8c85114513a5c4e5bcb8a'
  set :protection, true
  set :protect_from_csrf, true
end

# Mounts the core application for this project
Padrino.mount('PadrinoBlog::App', :app_file => Padrino.root('app/app.rb')).to('/')

Padrino.mount("PadrinoBlog::Admin", :app_file => File.expand_path('../../admin/app.rb', __FILE__)).to("/admin")