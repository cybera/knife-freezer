require 'chef/knife'

class Chef
  class Knife
    module FreezerBase
      def environment
        config[:environment] ||= (Chef::Config[:environment] || '_default')
        config[:environment]
      end

      def role
        name_args[0]
      end
      
      def attribute
        name_args[1]
      end

      def freezer_bag
        begin
          @freezer_bag ||= Chef::DataBag.load("#{environment}_freezer")
        rescue Net::HTTPServerException => e
          raise "Please create the #{environment}_freezer databag before running this command."
        end
        
        @freezer_bag
      end
    end
  end
end

