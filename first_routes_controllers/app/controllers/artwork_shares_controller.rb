class ArtworkSharesController < ApplicationController

    def create
        artwork_shares = ArtworkShare.new(artwork_shares_params)
        if artwork_shares.save # < with or without the ! it will save to the database
            render json: artwork_shares
        else
            render json: artwork_shares.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        incoming_wildcard = params[:id]
        artwork_shares = ArtworkShare.find(incoming_wildcard)
        artwork_shares.destroy
    end

    private

    def artwork_shares_params
        params.require(:artwork_shares).permit(:artwork_id, :viewer_id) # < we are going to require certain params in this artwork_shares
    end

end
