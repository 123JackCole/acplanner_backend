require "rest-client"

# Removes all old user accounts
User.destroy_all

# Removes all old checklists associated with user accounts
Dailychecklist.destroy_all
Task.destroy_all

# Removes all old bug, fish, fossil, and villager data
Collectable.destroy_all
Bug.destroy_all
Fish.destroy_all
Fossil.destroy_all
Villager.destroy_all

main_collection = Collectable.create(name: "seed_collection")

API_ENDPOINT = "https://nookipedia.com/api/"

API_KEY = "1df0466a-0645-4a04-a2e4-4c1b69b92c4b" # ENV["API_KEY"]

# Current list of Bugs
def bugNames()
  bugNames = [
    "Agrias%20Butterfly",
    "Ant",
    "Atlas%20Moth",
    "Bagworm",
    "Banded%20Dragonfly",
    "Bell%20Cricket",
    "Blue%20Weevil%20Beetle",
    "Brown%20Cicada",
    "Centipede",
    "Cicada%20Shell",
    "Citrus%20Long-Horned%20Beetle",
    "Common%20Bluebottle",
    "Common%20Butterfly",
    "Cricket",
    "Cyclommatus%20Stag",
    "Damselfly",
    "Darner%20Dragonfly",
    "Diving%20Beetle",
    "Drone%20Beetle",
    "Dung%20Beetle",
    "Earth-Boring%20Dung%20Beetle",
    "Emperor%20Butterfly",
    "Evening%20Cicada",
    "Firefly",
    "Flea",
    "Fly",
    "Giant%20Cicada",
    "Giant%20Stag",
    "Giant%20Water%20Bug",
    "Giraffe%20Stag",
    "Golden%20Stag",
    "Goliath%20Beetle",
    "Grasshopper",
    "Great%20Purple%20Emperor",
    "Hermit%20Crab",
    "Honeybee",
    "Horned%20Atlas",
    "Horned%20Dynastid",
    "Horned%20Elephant",
    "Horned%20Hercules",
    "Jewel%20Beetle",
    "Ladybug",
    "Long%20Locust",
    "Madagascan%20Sunset%20Moth",
    "Man-Faced%20Stink%20Bug",
    "Mantis",
    "Migratory%20Locust",
    "Miyama%20Stag",
    "Mole%20Cricket",
    "Monarch%20Butterfly",
    "Mosquito",
    "Moth",
    "Orchid%20Mantis",
    "Paper%20Kite%20Butterfly",
    "Peacock%20Butterfly",
    "Pill%20Bug",
    "Pondskater",
    "Queen%20Alexandra's%20Birdwing",
    "Rainbow%20Stag",
    "Rajah%20Brooke's%20Birdwing",
    "Red%20Dragonfly",
    "Rice%20Grasshopper",
    "Robust%20Cicada",
    "Rosalia%20Batesi%20Beetle",
    "Saw%20Stag",
    "Scarab%20Beetle",
    "Scorpion",
    "Snail",
    "Spider",
    "Stinkbug",
    "Tarantula",
    "Tiger%20Beetle",
    "Tiger%20Butterfly",
    "Violin%20Beetle",
    "Walker%20Cicada",
    "Walking%20Leaf",
    "Walking%20Stick",
    "Wasp",
    "Wharf%20Roach",
    "Yellow%20Butterfly",
  ]
  return bugNames
end

# Current list of Fish
def fishNames()
  fishNames = [
    "Anchovy",
    "Angelfish",
    "Arapaima",
    "Arowana",
    "Barred%20Knifejaw",
    "Barreleye",
    "Betta",
    "Bitterling",
    "Black%20Bass",
    "Blowfish",
    "Blue%20Marlin",
    "Bluegill",
    "Butterfly%20Fish",
    "Carp",
    "Catfish",
    "Char",
    "Cherry%20Salmon",
    "Clown%20Fish",
    "Coelacanth",
    "Crawfish",
    "Crucian%20Carp",
    "Dab",
    "Dace",
    "Dorado",
    "Football%20Fish",
    "Freshwater%20Goby",
    "Frog",
    "Gar",
    "Giant%20Snakehead",
    "Giant%20Trevally",
    "Golden%20Trout",
    "Goldfish",
    "Great%20White%20Shark",
    "Guppy",
    "Hammerhead%20Shark",
    "Horse%20Mackerel",
    "Killifish",
    "King%20Salmon",
    "Koi",
    "Loach",
    "Mahi-Mahi",
    "Mitten%20Crab",
    "Moray%20Eel",
    "Napoleonfish",
    "Neon%20Tetra",
    "Nibble%20Fish",
    "Oarfish",
    "Ocean%20Sunfish",
    "Olive%20Flounder",
    "Pale%20Chub",
    "Pike",
    "Piranha",
    "Pond%20Smelt",
    "Pop-Eyed%20Goldfish",
    "Puffer%20Fish",
    "Rainbowfish",
    "Ranchu%20Goldfish",
    "Ray",
    "Red%20Snapper",
    "Ribbon%20Eel",
    "Saddled%20Bichir",
    "Salmon",
    "Saw%20Shark",
    "Sea%20Bass",
    "Sea%20Butterfly",
    "Sea%20Horse",
    "Snapping%20Turtle",
    "Soft-Shelled%20Turtle",
    "Squid",
    "Stringfish",
    "Sturgeon",
    "Suckerfish",
    "Surgeonfish",
    "Sweetfish",
    "Tadpole",
    "Tilapia",
    "Tuna",
    "Whale%20Shark",
    "Yellow%20Perch",
    "Zebra%20Turkeyfish",
  ]
  return fishNames
end

# Current list of Fossils
def fossilNames()
  fossilNames = [
    "Acanthostega",
    "Amber",
    "Ammonite",
    "Ankylosaurus",
    "Anomalocaris",
    "Archaeopteryx",
    "Archelon",
    "Australopithecus",
    "Brachiosaurus",
    "Coprolite",
    # "Deinonychus",
    "Dimetrodon",
    "Dinosaur%20Track",
    "Diplodocus",
    "Dunkleosteus",
    "Eusthenopteron",
    "Iguanodon",
    "Juramaia",
    "Mammoth",
    "Megacerops",
    "Megaloceros",
    "Myllokunmingia",
    "Ophthalmosaurus",
    "Pachycephalosaurus",
    "Parasaurolophus",
    "Plesiosaurus",
    "Pteranodon",
    "Quetzalcoatlus",
    "Sabertooth%20Tiger",
    "Shark%20Tooth%20Pattern",
    "Spinosaurus",
    "Stegosaurus",
    "Triceratops",
    "Trilobite",
    "Tyrannosaurus%20Rex",
  ]
  return fossilNames
end

# Current list of Villagers
def villagerNames()
  villagerNames = [
    "Admiral",
    "Agent%20S",
    "Agnes",
    "Al",
    "Alfonso",
    "Alice",
    "Alli",
    "Amelia",
    "Anabelle",
    "Anchovy",
    "Ankha",
    "Angus",
    "Anicotti",
    "Annalisa",
    "Annalise",
    "Antonio",
    "Apollo",
    "Apple",
    "Astrid",
    "Audie",
    "Aurora",
    "Ava",
    "Avery",
    "Axel",
    "Baabara",
    "Bam",
    "Bangle",
    "Barold",
    "Beau",
    "Bea",
    "Beardo",
    "Becky",
    "Bella",
    "Benedict",
    "Benjamin",
    "Bertha",
    "Bettina",
    "Bianca",
    "Biff",
    "Big%20Top",
    "Bill",
    "Billy",
    "Biskit",
    "Bitty",
    "Blaire",
    "Blanche",
    "Bluebear",
    "Bob",
    "Bonbon",
    "Bones",
    "Boomer",
    "Boone",
    "Boone",
    "Boris",
    "Boyd",
    "Bree",
    "Broccolo",
    "Bruce",
    "Broffina",
    "Bubbles",
    "Buck",
    "Bud",
    "Bunnie",
    "Butch",
    "Buzz",
    "Cally",
    "Camofrog",
    "Canberra",
    "Candi",
    "Carmen",
    "Caroline",
    "Carrie",
    "Cashmere",
    "Celia",
    "Cesar",
    "Chadder",
    "Charlise",
    "Cheri",
    "Cherry",
    "Chester",
    "Chevre",
    "Chief",
    "Chops",
    "Chow",
    "Chrissy",
    "Claude",
    "Claudia",
    "Clay",
    "Cleo",
    "Clyde",
    "Coach",
    "Cobb",
    "Coco",
    "Cole",
    "Colton",
    "Cookie",
    "Cousteau",
    "Cranston",
    "Croque",
    "Cube",
    "Curlos",
    "Curly",
    "Curt",
    "Cyd",
    "Cyrano",
    "Daisy",
    "Deena",
    "Deirdre",
    "Del",
    "Deli",
    "Derwin",
    "Diana",
    "Diva",
    "Dizzy",
    "Dobie",
    "Doc",
    "Dom",
    "Dora",
    "Dotty",
    "Drago",
    "Drake",
    "Drift",
    "Ed",
    "Egbert",
    "Elise",
    "Ellie",
    "Elmer",
    "Eloise",
    "Elvis",
    "Erik",
    "Eunice",
    "Eugene",
    "Fang",
    "Fauna",
    "Felicity",
    "Filbert",
    "Flip",
    "Flo",
    "Flora",
    "Flurry",
    "Francine",
    "Frank",
    "Freckles",
    "Freya",
    "Friga",
    "Frita",
    "Frobert",
    "Fuchsia",
    "Gabi",
    "Gala",
    "Gaston",
    "Gayle",
    "Genji",
    "Gigi",
    "Gladys",
    "Gloria",
    "Goldie",
    "Gonzo",
    "Goose",
    "Graham",
    "Greta",
    "Grizzly",
    "Groucho",
    "Gruff",
    "Gwen",
    "Hamlet",
    "Hamphrey",
    "Hans",
    "Harry",
    "Hazel",
    "Henry",
    "Hippeux",
    "Hopkins",
    "Hopper",
    "Hornsby",
    "Huck",
    "Hugh",
    "Iggly",
    "Ike",
    "Jacob",
    "Jacques",
    "Jambette",
    "Jay",
    "Jeremiah",
    "Jitters",
    "Joey",
    "Judy",
    "Julia",
    "Julian",
    "June",
    "Kabuki",
    "Katt",
    "Keaton",
    "Ken",
    "Ketchup",
    "Kevin",
    "Kid%20Cat",
    "Kidd",
    "Kiki",
    "Kitt",
    "Kitty",
    "Klaus",
    "Knox",
    "Kody",
    "Kyle",
    "Leonardo",
    "Leopold",
    "Lily",
    "Limberg",
    "Lionel",
    "Lobo",
    "Lolly",
    "Lopez",
    "Louie",
    "Lucha",
    "Lucky",
    "Lucy",
    "Lyman",
    "Mac",
    "Maddie",
    "Maelle",
    "Maggie",
    "Mallary",
    "Maple",
    "Margie",
    "Marcel",
    "Marcie",
    "Marina",
    "Marshal",
    "Mathilda",
    "Megan",
    "Melba",
    "Merengue",
    "Merry",
    "Midge",
    "Mint",
    "Mira",
    "Miranda",
    "Mitzi",
    "Moe",
    "Molly",
    "Monique",
    "Monty",
    "Moose",
    "Mott",
    "Muffy",
    "Murphy",
    "Nan",
    "Nana",
    "Naomi",
    "Nate",
    "Nibbles",
    "Norma",
    "Octavian",
    "O'Hare",
    "Olaf",
    "Olive",
    "Olivia",
    "Opal",
    "Ozzie",
    "Pancetti",
    "Pango",
    "Papi",
    "Paolo",
    "Pashmina",
    "Pate",
    "Patty",
    "Paula",
    "Peaches",
    "Peanut",
    "Pecan",
    "Peck",
    "Peewee",
    "Peggy",
    "Pekoe",
    "Penelope",
    "Phil",
    "Phoebe",
    "Pierce",
    "Pietro",
    "Pinky",
    "Piper",
    "Pippy",
    "Plucky",
    "Pompom",
    "Poncho",
    "Poppy",
    "Portia",
    "Prince",
    "Puck",
    "Puddles",
    "Pudge",
    "Punchy",
    "Purrl",
    "Queenie",
    "Quillson",
    "Raddle",
    "Rasher",
    "Raymond",
    "Renee",
    "Reneigh",
    "Rex",
    "Rhonda",
    "Ribbot",
    "Ricky",
    "Rizzo",
    "Roald",
    "Robin",
    "Rocco",
    "Rocket",
    "Rod",
    "Rodeo",
    "Rodney",
    "Rolf",
    "Rooney",
    "Rory",
    "Roscoe",
    "Rosie",
    "Rowan",
    "Ruby",
    "Rudy",
    "Sally",
    "Samson",
    "Sandy",
    "Savannah",
    "Scoot",
    "Scoot",
    "Sheldon",
    "Shep",
    "Sherb",
    "Simon",
    "Skye",
    "Sly",
    "Snake",
    "Snooty",
    "Soleil",
    "Sparro",
    "Spike",
    "Spork",
    "Sprinkle",
    "Sprocket",
    "Static",
    "Stella",
    "Sterling",
    "Stinky",
    "Stitches",
    "Stu",
    "Sydney",
    "Sylvana",
    "Sylvia",
    "Tabby",
    "Tad",
    "Tammi",
    "Tammy",
    "Tangy",
    "Tank",
    "T-Bone",
    "Tasha",
    "Teddy",
    "Tex",
    "Tia",
    "Tiffany",
    "Timbra",
    "Tipper",
    "Tom",
    "Truffles",
    "Tucker",
    "Tutu",
    "Twiggy",
    "Tybalt",
    "Ursala",
    "Velma",
    "Vesta",
    "Vic",
    "Victoria",
    "Violet",
    "Vivian",
    "Vladimir",
    "Wade",
    "Walker",
    "Walt",
    "Wart%20Jr.",
    "Weber",
    "Wendy",
    "Winnie",
    "Whitney",
    "Willow",
    "Wolfgang",
    "Yuka",
    "Zell",
    "Zucker",
  ]
  return villagerNames
end

def seedBugs(bugsArray)
  bugsArray.each_with_index do |element, index|
    begin
      RestClient.get("#{API_ENDPOINT}critter/#{bugsArray[index]}/?api_key=#{API_KEY}") { |response, request, result, &block|
        case response.code
        when 200
          bug = JSON.parse(response)
          Bug.create(
            collectable_id: Collectable.find_by(name: "seed_collection").id,
            name: bug["name"],
            image: bug["image"],
            scientific_name: bug["scientific-name"],
            family: bug["family"],
            time_year: bug["time-year"],
            time_day: bug["time-day"],
            location: bug["location"],
            size: bug["size"],
            rarity: bug["rarity"],
            price: bug["price"],
          )
          puts bug["name"]
        else
        #   ''
          # response.return!(request, result, &block)
          # puts "something went wrong with #{element}, error #{response.code}"
        end
      }
    end
    sleep(11)
  end
end

def seedFish(fishArray)
  fishArray.each_with_index do |element, index|
    begin
      RestClient.get("#{API_ENDPOINT}critter/#{fishArray[index]}/?api_key=#{API_KEY}") { |response, request, result, &block|
        case response.code
        when 200
          fish = JSON.parse(response)
          Fish.create(
            collectable_id: Collectable.find_by(name: "seed_collection").id,
            name: fish["name"],
            image: fish["image"],
            scientific_name: fish["scientific-name"],
            family: fish["family"],
            time_year: fish["time-year"],
            time_day: fish["time-day"],
            location: fish["location"],
            size: fish["size"],
            rarity: fish["rarity"],
            price: fish["price"],
            shadow: fish["shadow"],
          )
          puts fish["name"]
        else
        #   ''
          # response.return!(request, result, &block)
          # puts "something went wrong with #{element}, error #{response.code}"
        end
      }
    end
    sleep(11)
  end
end

def seedFossils(fossilsArray)
  fossilsArray.each_with_index do |element, index|
    begin
      RestClient.get("#{API_ENDPOINT}fossil/#{fossilsArray[index]}/?api_key=#{API_KEY}") { |response, request, result, &block|
        case response.code
        when 200
          fossil = JSON.parse(response)
          Fossil.create(
            collectable_id: Collectable.find_by(name: "seed_collection").id,
            name: fossil["name"],
            image: fossil["image"],
            scientific_name: fossil["scientific-name"],
            sections: fossil["sections"],
            period: fossil["period"],
            length: fossil["length"],
            price: fossil["price"],
          )
          puts fossil["name"]
        else
        #   ''
          # response.return!(request, result, &block)
          # puts "something went wrong with #{element}, error #{response.code}"
        end
      }
    end
    sleep(11)
  end
end

def seedVillagers(villagersArray)
  villagersArray.each_with_index do |element, index|
    begin
      RestClient.get("#{API_ENDPOINT}villager/#{villagersArray[index]}/?api_key=#{API_KEY}") { |response, request, result, &block|
        case response.code
        when 200
          villager = JSON.parse(response)
          Villager.create(
            name: villager["name"],
            image: villager["image"],
            quote: villager["quote"],
            gender: villager["gender"],
            personality: villager["personality"],
            species: villager["species"],
            birthday: villager["birthday"],
            sign: villager["sign"],
            phrase: villager["phrase"],
            clothes: villager["clothes"],
            siblings: villager["siblings"],
            goal: villager["goal"],
            fear: villager["fear"],
            favclothing: villager["favclothing"],
            leastfavclothing: villager["leastfavclothing"],
            favcolor: villager["favcolor"],
          )
          puts villager["name"]
        else
        #   ''
          # response.return!(request, result, &block)
          puts "something went wrong with #{element}, error #{response.code}"
        end
      }
    end
    sleep(11)
  end
end

def callApi()
  seedBugs(bugNames())
  sleep(1)
  seedFish(fishNames())
  sleep(1)
  seedFossils(fossilNames())
  sleep(1)
  seedVillagers(villagerNames())
end

callApi()
