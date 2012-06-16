require 'chef/knife'

class Chef
  class Knife
    class FreezerRemove < Knife
      banner "knife freezer remove ROLE ATTRIBUTE (options)"
      
      def run
        role = name_args[0]
        attribute = name_args[1]

        ui.info "Removed attribute '#{attribute}' of role '#{role}' from the freezer!"
      end
    end
  end
end
