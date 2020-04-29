# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
Collectable.destroy_all
Bug.destroy_all
Fish.destroy_all
Fossil.destroy_all
Villager.destroy_all

main_collection = Collectable.create( name: 'seed_collection' )

ant = Bug.create(
    collectable_id: main_collection.id,
    name: "Ant",
    image: "https://nookipedia.com/w/images/thumb/4/4a/Ant_NH.png/200px-Ant_NH.png",
    scientific_name: "N/A",
    family: "Formicidae - Ants",
    time_year: "All year",
    time_day: "All day",
    location: "Discarded food, trash",
    size: "5 mm",
    rarity: "Common",
    price: "80 Bells"
)

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

tuna = Fish.create(
    collectable_id: main_collection.id,
    name: "Tuna",
    image: "https://nookipedia.com/w/images/thumb/6/60/Tuna_NH.png/200px-Tuna_NH.png",
    scientific_name: "Thunnus orientalis",
    family: "Scombridae - Tuna",
    time_year: "November to March",
    time_day: "All day",
    location: "OceanPier",
    size: "225 cm",
    rarity: "Rare",
    price: "7,000 Bells",
    shadow: "Huge"
)

Amber = Fossil.create(
    collectable_id: main_collection.id,
    name: "Amber",
    image: "https://nookipedia.com/w/images/5/5a/Amber.jpg",
    scientific_name: "Amber",
    sections: "N/A",
    period: "N/A",
    length: "N/A",
    price: "1,200 Bells"
)

Archelon = Fossil.create(
    collectable_id: main_collection.id,
    name: "Archelon",
    image: "https://nookipedia.com/w/images/thumb/7/70/Archelon.jpg/200px-Archelon.jpg",
    scientific_name: "Archelon ischyros",
    sections: "Archelon Skull\nArchelon Torso",
    period: "Late Cretaceous",
    length: "13 feet (6.5 meters)",
    price: "Skull: 4,000 Bells\nTorso: 3,500 Bells"
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

tia = Villager.create(
    name: "Tia",
    image: "https://nookipedia.com/w/images/thumb/6/67/Tia_NL.png/200px-Tia_NL.png",
    quote: "Tea is a cup of life.",
    gender: "Female",
    personality: "Normal",
    species: "Elephant",
    birthday: "November 18th",
    sign: "Scorpio",
    phrase: "teacup",
    clothes: "Garden Tank",
    picture: "https://nookipedia.com/w/images/1/1d/TiaPicACNL.png",
    siblings: "Fourth of six",
    goal: "Dentist",
    fear: "Skeleton Hood",
    favclothing: "Cute",
    leastfavclothing: "Rock 'n' Roll",
    favcolor: "Beige"
)