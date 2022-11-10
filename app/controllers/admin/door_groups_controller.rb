module Admin
  class DoorGroupsController < AdminPanelController

    def show
      @door_groups = DoorGroup.all
      @door_group = DoorGroup.find(params[:id])
    end

  end
end