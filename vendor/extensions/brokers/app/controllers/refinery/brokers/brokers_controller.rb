module Refinery
  module Brokers
    class BrokersController < ::ApplicationController

      before_filter :find_all_brokers
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @broker in the line below:
        present(@page)
      end

      def show
        @broker = Broker.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @broker in the line below:
        present(@page)
      end

    protected

      def find_all_brokers
        @brokers = Broker.all
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/brokers").first
      end

    end
  end
end
