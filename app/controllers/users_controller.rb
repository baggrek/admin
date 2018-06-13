class UsersController < ApiController
    # before_action :set_user, only: [:show, :update, :destroy]    
    skip_before_action :authorize_request, only: :create

    def index
        @users = User.all
        response = { status: :OK, result: @users, errors: nil }
        render json: response
        #json_response(@users)
    end
    
     def show
        @users = User.find(params[:id])
        response = { status: :OK, result: @users, errors: nil }
        render json: response
        #json_response(@users)
    end

    def create 
        #user = User.create!(user_params)
        user = User.create(user_params)
        #auth_token = AuthenticateUser.new(user.email, user.password).call
        if user.save
            response = { status: :OK, result: Message.account_created, errors: nil }
            render json: response
            # @user = User.create!(user_params)
            # json_response(@user, :create)
        else
            response = { status: :FAIL, result: nil, errors: user.errors }
            render json: response
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            #render json: { message: 'User has been update.' }
            response = { status: :OK, result: @user, errors: nil }
            render json: response
        else
            response = { status: :FAIL, result: nil, errors: @user.errors }
            render json: response
        end
    end

    def destroy
        @user = User.find(params[:id])
        if @user.destroy
            response = { status: :OK, result: 'User has been deleted', errors: nil }
            render json: response
          else
            response = { status: :FAIL, result: nil, errors: @user.errors }
            render json: response
        end
    end


    private

    def user_params
        params.permit(:first_name, :last_name, :address, :email, :tlp, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end
end
