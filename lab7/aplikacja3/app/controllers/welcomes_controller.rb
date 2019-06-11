class WelcomesController < ApplicationController
    def show
        sought_id = params[:id].to_i
        @msg = Welcome.find_by(id: sought_id).message
    end

    def create
        msg = params['welcome']['message']
        created = Welcome.create(message: msg)
        redirect_to welcome_path(created.id)
    end
end
