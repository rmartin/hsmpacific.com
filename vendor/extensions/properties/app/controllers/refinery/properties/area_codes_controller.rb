module Refinery
  module Properties
    class AreaCodesController < ::ApplicationController

      before_filter :find_all_area_codes
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @area_code in the line below:
        present(@page)
      end

      def show
        @area_code = AreaCode.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @area_code in the line below:
        present(@page)
      end

    protected

      def find_all_area_codes
        @area_codes = AreaCode.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/area_codes").first
      end

    end
  end
end
