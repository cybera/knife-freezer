require 'chef/knife'
require 'chef/knife/freezer_base'

class Chef
  class Knife
    class FreezerRemove < Knife
      include Knife::FreezerBase

      banner "knife freezer remove ROLE ATTRIBUTE (options)"
      
      def run
        (role_item_id, role_item_url) = freezer_bag.find { |item, url| item == role }

        if !role_item_id
          raise "No attribute '#{attribute}' of role '#{role}' stored in the freezer!"
        else
          role_item = Chef::DataBagItem.load("#{config[:environment]}_freezer", role_item_id)
          role_item.raw_data = role_item.raw_data.select { |k,v| k.to_s != attribute }
          role_item.save

          ui.info "Removed attribute '#{attribute}' of role '#{role}' from the freezer!"
        end
      end
    end
  end
end
