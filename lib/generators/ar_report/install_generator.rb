module ArReport
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Creates config file to your application."

      def copy_initializer
        require 'rails'
        template '../templates/ar_report.yml', 'config/ar_report.yml'
      end
    
    end
  end
end
