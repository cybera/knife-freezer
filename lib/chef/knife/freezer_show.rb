require 'chef/knife'
require 'chef/knife/freezer_base'

class Chef
  class Knife
    class FreezerShow < Knife
      include Knife::FreezerBase
      
      banner "knife freezer show ROLE ATTRIBUTE (options)"
      
      def run
        (role_item_id, role_item_url) = freezer_bag.find { |item, url| item == role }
        if !role_item_id
          raise "No attributes for role '#{role}' stored in the freezer!"
        else
          role_item = Chef::DataBagItem.load("#{config[:environment]}_freezer", role_item_id)
          attribute_value = role_item.raw_data[attribute]
          if attribute_value
            output(format_for_display(attribute_value))
          else
            raise "No attribute '#{attribute}' for role '#{role}' stored in the freezer!"
          end
        end
      end
    end
  end
end
