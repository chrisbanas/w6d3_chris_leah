# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :text             not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, uniqueness: {scope: :artist_id}

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

    # def self.artworks_for_user_id
    #     Artwork
    #         .join(:shared_viewers)
    #         .pluck("users.id")
    # end

    def self.artworks_for_user_id(user_id)
        shared_art = Artwork
                        .joins(:shared_viewers)
                        .where("users.id = (?)", user_id)
                        .pluck("artworks.title")

        owned_art = Artwork.where("artist_id = (?)", user_id).pluck("artworks.title")

        (owned_art + shared_art)
    end
end
