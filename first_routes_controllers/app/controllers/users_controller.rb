
class UsersController < ApplicationController

    # we did not define a custom route for the below it is all done through the index function.
    # http://localhost:3000/users?query=leah
    # this is how it gets passed to postman to return the result. :query is the key and we set the value to the user that wer want to search. The params :query is taking in the value leah and passing that though as the key for username: in the user variable.
    def index
        user = User.find_by(username: params[:query])
            if user && params[:query]
                render json: user
            else
                render json: User.all
            end
    end

    def create

        # user[name] < how it gets passed to postman so when the params returns it will be a nested object {"user"=>{"name"=>"darren", "email"=>"darren@gmail.com"}}

        user = User.new(params.require(:user).permit(:username))
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
        params.require(:user).permit(:username) # < we are going to require certain params in this user
    end


end
