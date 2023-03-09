class ArtworksController < ApplicationController
    def index
        render json: Artwork.all
    end

    def create

        # artwork[name] < how it gets passed to postman so when the params returns it will be a nested object {"artwork"=>{"name"=>"darren", "email"=>"darren@gmail.com"}}

        artwork = Artwork.new(artwork_params)
        if artwork.save # < with or without the ! it will save to the database
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        artwork = Artwork.find(params[:id])
        if artwork
            render json: artwork
        else
            render json: ['not found'], status: 404
        end
    end

    def update
        artwork = Artwork.find_by(id: params[:id]) # < this returns nil if it is not found
        if artwork && artwork.update(artwork_params) # < this protects against the nil
            redirect_to artwork_url(artwork.id)
        end

    end

    def destroy
        incoming_wildcard = params[:id]
        artwork = Artwork.find(incoming_wildcard)
        artwork.destroy
        redirect_to artworks_url # < works if it is "artwork_url" or "artworks_url"
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id) # < we are going to require certain params in this artwork
    end

end
