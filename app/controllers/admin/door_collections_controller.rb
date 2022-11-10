module Admin
  class DorrCollectionsController < AdminPanelController

    def index
      @door_collections = DoorCollection.all
    end

  end
end