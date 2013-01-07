module Refinery
  module Properties
    class CitiesController < ::ApplicationController

      before_filter :find_all_cities
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @city in the line below:
        present(@page)
      end

      def show
        @city = City.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @city in the line below:
        present(@page)
      end

    protected

      def find_all_cities
        @cities = City.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/cities").first
      end

    end
  end
end
