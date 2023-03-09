# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  author_id  :bigint           not null
#  artwork_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord
    validates :body, presence: true

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork

    def self.comments_for_user(id)
         Comment
            .where('author_id = (?)', id)
            .pluck('comments.body')
    end

    def self.comments_for_artwork(id)
        Comment  
            .where('artwork_id = (?)', id)
            .pluck('comments.body')
    end


end
