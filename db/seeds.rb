# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Collectable.destroy_all
Bug.destroy_all
Fish.destroy_all
Fossil.destroy_all
Villager.destroy_all

main_collection = Collectable.create( name: 'seed_collection' )

moth = Bug.create(
    collectable_id: main_collection.id,
    name: "Moth",
    image: "https://nookipedia.com/w/images/thumb/a/ab/Moth_NH.png/200px-Moth_NH.png",
    scientific_name: "Opodiphthera eucalypti",
    family: "Saturniidae",
    time_year: "May to September",
    time_day: "7pm to 4am",
    location: "Near outside lights",
    size: "60 mm",
    rarity: "N/A",
    price: "130 Bells"
)

sturgeon = Fish.create(
    collectable_id: main_collection.id,
    name: "Sturgeon",
    image: "https://nookipedia.com/w/images/thumb/1/1c/Sturgeon_NH.png/200px-Sturgeon_NH.png",
    scientific_name: "Acipenser oxyrinchus oxyrinchus",
    family: "Acipenseridae",
    time_year: "September to March  (Northern Hemisphere)\nMarch to September  (Southern Hemisphere)",
    time_day: "All day",
    location: "River (Mouth)",
    size: "N/A",
    rarity: "Rare",
    price: "10,000 Bells",
    shadow: "Huge"
)

Archelon = Fossil.create(
    collectable_id: main_collection.id,
    name: "Archelon",
    image: "https://nookipedia.com/w/images/thumb/7/70/Archelon.jpg/200px-Archelon.jpg",
    scientific_name: "Archelon ischyros",
    sections: "Archelon SkullArchelon Torso",
    period: "Late Cretaceous",
    length: "13 feet (6.5 meters)",
    price: "Skull: 4,000 BellsTorso: 3,500 Bells"
)

static = Villager.create(
    name: "Static",
    image: "https://nookipedia.com/w/images/thumb/2/2e/Static_NH_2.png/175px-Static_NH_2.png",
    quote: "Lightning never strikes twice.",
    gender: "Male",
    personality: "Cranky",
    species: "Squirrel",
    birthday: "July 9th",
    sign: "Cancer",
    phrase: "krzzt",
    clothes: "Dragon Jacket",
    picture: "https://nookipedia.com/w/images/7/77/StaticPicACNL.png",
    siblings: "N/A",
    goal: "N/A",
    fear: "N/A",
    favclothing: "N/A",
    leastfavclothing: "N/A",
    favcolor: "N/A"
)