class RolesController < ApplicationController
    before_action :set_role, only: [:show, :update, :destroy]
  
    # GET /roles
    def index
      @roles = Role.all
      response = { status: :OK, result: @roles, errors: nil }
      render json: response
    end
  
    # GET /roles/1
    def show
      @roles = Role.find(params[:id])
      response = { status: :OK, result: @roles, errors: nil }
      render json: response
    end
  
    # POST /roles
    def create
      @role = Role.new(role_params)
  
      if @role.save
        response = { status: :OK, result: 'Role created successfully', errors: nil }
        render json: response, location: @role
      else
        response = { status: :FAIL, result: nil, errors: @role.errors }
        render json: response
        #render json: @role.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /roles/1
    def update
      if @role.update(role_params)
        response = { status: :OK, result: @role, errors: nil }
        render json: response
      else
        response = { status: :FAIL, result: nil, errors: @role.errors }
        render json: response
        #render json: @role.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /roles/1
    def destroy
      if @role.destroy
        response = { status: :OK, result: 'Role has been deleted', errors: nil }
        render json: response
      else
        response = { status: :FAIL, result: nil, errors: @role.errors }
        render json: response
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_role
        @role = Role.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def role_params
        params.require(:role).permit(:role_name)
      end
end