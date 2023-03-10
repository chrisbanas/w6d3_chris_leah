# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#

# chris = User.new(name: "chris", email: "chris@gmail.com")
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
        foreign_key: :artist_id,
        class_name: :Artwork,
        dependent: :destroy

    has_many :artwork_shares,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare,
        dependent: :destroy
        
    has_many :shared_artworks,
        through: :artwork_shares,
        source: :artwork
    
    has_many :comments,
        foreign_key: :author_id,
        class_name: :Comment,
        dependent: :destroy
    
    has_many :likes, as: :likeable,
        foreign_key: :liker_id,
        class_name: :Like

end 
