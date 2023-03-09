# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


chris = User.new(
    username: "chris"
)

leah = User.new(
    username: "leah"
)

darren = User.new(
    username: "darren"
)

taylor = User.new(
    username: "taylor"
)

diego = User.new(
    username: "diego"
)

art1 = Artwork.new(
    title: "art1",
    image_url: "www.art1.com",
    artist_id: chris.id
)

art2 = Artwork.new(
    title: "art2",
    image_url: "www.art2.com",
    artist_id: leah.id
)

art3 = Artwork.new(
    title: "art3",
    image_url: "www.art3.com",
    artist_id: darren.id
)

art4 = Artwork.new(
    title: "art4",
    image_url: "www.art4.com",
    artist_id: taylor.id
)

art5 = Artwork.new(
    title: "art5",
    image_url: "www.art5.com",
    artist_id: diego.id
)

# this is tagging art5 with three different artists

art6 = Artwork.new(
    title: "art5",
    image_url: "www.art6.com",
    artist_id: chris.id
)

art7 = Artwork.new(
    title: "art5",
    image_url: "www.art7.com",
    artist_id: leah.id
)
