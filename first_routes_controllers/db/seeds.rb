# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# rails db:seed:replant - replants the database if you want to update it

ActiveRecord::Base.transaction do
    puts "Preparing #{Rails.env} environment"

    puts 'Destroying tables...'
    User.destroy_all
    Artwork.destroy_all
    ArtworkShare.destroy_all
    Comment.destroy_all

    puts 'Resetting id sequences...'
    %w(users artworks artwork_shares comments).each do |table_name|
        ApplicationRecord.connection.reset_pk_sequence!(table_name)
    end

# when seeding must use .create instead of .new otherwise the data does not get created in the database

puts 'Creating seed data...'
chris = User.create(
    username: "chris"
)

leah = User.create(
    username: "leah"
)

darren = User.create(
    username: "darren"
)

taylor = User.create(
    username: "taylor"
)

diego = User.create(
    username: "diego"
)

art1 = Artwork.create(
    title: "art1",
    image_url: "www.art1.com",
    artist_id: chris.id
)

art2 = Artwork.create(
    title: "art2",
    image_url: "www.art2.com",
    artist_id: leah.id
)

art3 = Artwork.create(
    title: "art3",
    image_url: "www.art3.com",
    artist_id: darren.id
)

art4 = Artwork.create(
    title: "art4",
    image_url: "www.art4.com",
    artist_id: taylor.id
)

art5 = Artwork.create(
    title: "art5",
    image_url: "www.art5.com",
    artist_id: diego.id
)

# this is tagging art5 with three different artists

art6 = Artwork.create(
    title: "art5",
    image_url: "www.art6.com",
    artist_id: chris.id
)

art7 = Artwork.create(
    title: "art5",
    image_url: "www.art7.com",
    artist_id: leah.id
)

# artwork shares

share1 = ArtworkShare.create(
    artwork_id: art1.id,
    viewer_id: leah.id
)

share2 = ArtworkShare.create(
    artwork_id: art2.id,
    viewer_id: chris.id
)

share3 = ArtworkShare.create(
    artwork_id: art3.id,
    viewer_id: diego.id
)

share4 = ArtworkShare.create(
    artwork_id: art4.id,
    viewer_id: taylor.id
)

share5 = ArtworkShare.create(
    artwork_id: art5.id,
    viewer_id: darren.id
)

share6 = ArtworkShare.create(
    artwork_id: art6.id,
    viewer_id: leah.id
)

share7 = ArtworkShare.create(
    artwork_id: art7.id,
    viewer_id: darren.id
)

comment1 = Comment.create(
    body: "comment1",
    author_id: chris.id,
    artwork_id: art1.id
)

comment2 = Comment.create(
    body: "comment2",
    author_id: leah.id,
    artwork_id: art2.id
)

comment3 = Comment.create(
    body: "comment3",
    author_id: darren.id,
    artwork_id: art3.id
)

comment4 = Comment.create(
    body: "comment4",
    author_id: taylor.id,
    artwork_id: art4.id
)

comment5 = Comment.create(
    body: "comment5",
    author_id: diego.id,
    artwork_id: art5.id
)

comment6 = Comment.create(
    body: "comment6",
    author_id: diego.id,
    artwork_id: art3.id
)

comment7 = Comment.create(
    body: "comment7",
    author_id: leah.id,
    artwork_id: art1.id
)

puts "Done with #{Rails.env} environment!"

end
