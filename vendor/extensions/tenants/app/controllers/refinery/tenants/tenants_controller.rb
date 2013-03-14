module Refinery
  module Tenants
    class TenantsController < ::ApplicationController

      before_filter :find_all_tenants
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @tenant in the line below:
        present(@page)
      end

      def show
        @tenant = Tenant.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @tenant in the line below:
        present(@page)
      end

    protected

      def find_all_tenants
        @tenants = Tenant.order('name ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/tenants").first
      end

    end
  end
end
