
class UsersController < ApplicationController
    def index
        render json: User.all
    end

    def create

        # user[name] < how it gets passed to postman so when the params returns it will be a nested object {"user"=>{"name"=>"darren", "email"=>"darren@gmail.com"}}

        user = User.new(params.require(:user).permit(:name, :email))
        if user.save # < with or without the ! it will save to the database
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        user = User.find(params[:id])
        if user
            render json: user
        else
            render json: ['not found'], status: 404
        end
    end

    def update
        user = User.find_by(id: params[:id]) # < this returns nil if it is not found
        if user && user.update(user_params) # < this protects against the nil
            redirect_to user_url(user.id)
        end

    end

    def destroy
        incoming_wildcard = params[:id]
        user = User.find(incoming_wildcard)
        user.destroy
        redirect_to users_url # < works if it is "user_url" or "users_url"
    end

    private

    def user_params
        params.require(:user).permit(:email) # < we are going to require certain params in this user
    end


end
