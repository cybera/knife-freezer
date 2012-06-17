require 'chef/knife'
require 'chef/knife/freezer_base'

class Chef
  class Knife
    class FreezerStore < Knife
      include Knife::FreezerBase
      
      banner "knife freezer store ROLE ATTRIBUTE (options)"
      
      def run
        attribute_hash = nil
        query_nodes = Chef::Search::Query.new
        query_nodes.search(:node, "role:#{role} AND chef_environment:#{environment}") do |node_item|
          attribute_value = node_item[attribute]
          attribute_hash = { attribute => node_item[attribute].to_hash }
        end
        
        role_item = nil

        (role_item_id, role_item_url) = freezer_bag.find { |item, url| item == role }
        if !role_item_id
          ui.msg "nil role_item... creating"
          role_item = Chef::DataBagItem.new
          role_item.data_bag("#{environment}_freezer")
          role_item.raw_data = {
            "id" => "#{role}"
          }          
        else
          role_item = Chef::DataBagItem.load("#{environment}_freezer", role_item_id)
        end

        role_item.raw_data = role_item.raw_data.merge(attribute_hash)

        role_item.save

        ui.info "Stored attribute '#{attribute}' of role '#{role}' in the freezer!"
      end
    end
  end
end
