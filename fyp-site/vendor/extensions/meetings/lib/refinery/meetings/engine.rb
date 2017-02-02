module Refinery
  module Meetings
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Meetings

      engine_name :refinery_meetings

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "meetings"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.meetings_admin_meetings_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Meetings)
      end
    end
  end
end
