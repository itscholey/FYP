module Refinery
  module Meetings
    module Admin
      class MeetingsController < ::Refinery::AdminController

        crudify :'refinery/meetings/meeting',
                :title_attribute => 'meeting_title'

        private

        # Only allow a trusted parameter "white list" through.
        def meeting_params
          params.require(:meeting).permit(:meeting_title, :date, :location, :agenda)
        end
      end
    end
  end
end
