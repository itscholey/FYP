module Refinery
  module Meetings
    class MeetingsController < ::ApplicationController

      before_action :find_all_meetings
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @meeting in the line below:
        present(@page)
      end

      def show
        @meeting = Meeting.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @meeting in the line below:
        present(@page)
      end

    protected

      def find_all_meetings
        @meetings = Meeting.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/meetings").first
      end

    end
  end
end
