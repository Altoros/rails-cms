require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdminMyImages
end

module RailsAdmin
  module Config
    module Actions

      class MyImages < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :controller do
          proc do
            @objects = Image.my_images(current_user)
            render :index
          end
        end

        register_instance_option :collection do
          true
        end

        register_instance_option :only do
          Image
        end

        register_instance_option :link_icon do
          'icon-th-list'
        end
      end
    end
  end
end
