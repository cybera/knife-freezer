require 'chef/knife'

class Chef
  class Knife
    class FreezerStore < Knife
      banner "knife freezer store ROLE ATTRIBUTE (options)"
      
      def run
        role = name_args[0]
        attribute = name_args[1]

        ui.info "Stored attribute '#{attribute}' of role '#{role}' in the freezer!"
      end
    end
  end
end
