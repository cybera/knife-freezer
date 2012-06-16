require 'chef/knife'

class Chef
  class Knife
    class FreezerShow < Knife
      banner "knife freezer show ROLE ATTRIBUTE (options)"
      
      def run
        role = name_args[0]
        attribute = name_args[1]

        ui.info "...show attribute..."
      end
    end
  end
end
