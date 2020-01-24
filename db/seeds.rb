User.destroy_all
Origami.destroy_all
Basket.destroy_all
Post.destroy_all


#Create a few user instances
puts "Seeding users...."
u1 = User.create(name: "Summer Rizzo", username: "summeroo", bio: "Folding paper puts me in a tranquil state.")
u2 = User.create(name: "Monsur Kahn", username: "mk17173n", bio: "I love comic books and making origami!")

#Array containing info for origami instances
origamis = [
    {title: "Cat",
    category: "Animal",
    style: "Traditional",
    difficulty: 2,
    finished_image_url: "https://origamiusa.org/files/diagrams_pdf_image/traditional_cat_thumb.png",
    instruction_image_url: "https://origamiusa.org/files/traditional_cat.pdf",
    description: "A traditional cat head origami."
    },
    {title: "8 Petal Flower",
    category: "Flower",
    style: "Traditional",
    difficulty: 4,
    finished_image_url: "https://origamiusa.org/files/styles/diagrams_image/public/diagrams_pdf_image/8_petal_flower.jpg?itok=ixP14Xdu",
    instruction_image_url: "https://origamiusa.org/files/8_petal_flower.pdf",
    description: "A flower head with 8 petals."
    },
    {title: "Frog",
    category: "Animal",
    style: "Traditional",
    difficulty: 2,
    finished_image_url: "https://origamiusa.org/files/styles/diagrams_image/public/diagrams_pdf_image/frog.jpg?itok=nVNDpxjn",
    instruction_image_url: "https://origamiusa.org/files/frog.pdf",
    description: "A traditional frog origami."
    },
    {title: "Iris",
    category: "Flower",
    style: "Traditional",
    difficulty: 4,
    finished_image_url: "https://origamiusa.org/files/styles/diagrams_image/public/diagrams_pdf_image/iris.jpg?itok=voIC19ac",
    instruction_image_url: "https://origamiusa.org/files/iris.pdf",
    description: "An iris flower head."
    },
    {title: "Cup",
    category: "Object",
    style: "Traditional",
    difficulty: 2,
    finished_image_url: "",
    instruction_image_url: "https://origamiusa.org/files/atsushi-cup.pdf",
    description: "A small cup."
    },
    {title: "Crane",
    category: "Animal",
    style: "Traditional",
    difficulty: 3,
    finished_image_url: "https://origamiusa.org/files/styles/diagrams_image/public/diagrams_pdf_image/traditional-crane.jpg?itok=UIWd4WQp",
    instruction_image_url: "https://origamiusa.org/files/traditional-crane.pdf",
    description: "The classic crane origami. It does not tweet."
    },
    {title: "Flower with Leaf",
    category: "Flower",
    style: "Traditional",
    difficulty: 5,
    finished_image_url: "https://origamiusa.org/files/styles/diagrams_image/public/diagrams_pdf_image/flower-with-leaf.jpg?itok=bmVRQmr9",
    instruction_image_url: "https://origamiusa.org/files/flower-with-leaf.pdf",
    description: "Flower with a pointy leaf attachment. Don't worry; there are no thorns."
    },
    {title: "Pencil",
    category: "Object",
    style: "Traditional",
    difficulty: 1,
    finished_image_url: "https://origamiusa.org/files/styles/diagrams_image/public/diagrams_pdf_image/pencil.jpg?itok=PLhh7RHM",
    instruction_image_url: "https://origamiusa.org/files/pencil.pdf",
    description: "The top half of a pencil. It doesn't write, but maybe if you dipped it in ink it could. Something to ponder."
    },
    {title: "Swan",
    category: "Animal",
    style: "Traditional",
    difficulty: 4,
    finished_image_url: "https://origamiusa.org/files/styles/diagrams_image/public/diagrams_pdf_image/atsushi-swan.jpg?itok=DIHxoIhh",
    instruction_image_url: "https://origamiusa.org/files/atsushi-swan.pdf",
    description: "A beautiful, traditional swan. More elegant, albeit more difficult, than the classic crane."
    },
    {title: "Tulip",
    category: "Flower",
    style: "Traditional",
    difficulty: 4,
    finished_image_url: "https://origamiusa.org/files/styles/diagrams_image/public/diagrams_pdf_image/tulip-traditional.jpg?itok=eyVanw_x",
    instruction_image_url: "https://origamiusa.org/files/tulip-traditional.pdf",
    description: "A tulip head. The instructions include a leaf, but it is optional."
    },
    {title: "Brachiosaurus",
    category: "Object",
    style: "Traditional",
    difficulty: 5,
    finished_image_url: "https://origamiusa.org/files/styles/diagrams_image/public/diagrams_pdf_image/bachis_brachiosaurus.jpg?itok=ZZCUMXGs",
    instruction_image_url: "https://origamiusa.org/files/diagrams_pdf/bachis_brachiosaurus.pdf",
    description: "Large dinosaur with large neck."
    },
    {title: "Boat",
    category: "Object",
    style: "Traditional",
    difficulty: 1,
    finished_image_url: "https://origamiusa.org/files/styles/diagrams_image/public/diagrams_pdf_image/traditional_boat_thumb.png?itok=il6aa8VX",
    instruction_image_url: "https://origamiusa.org/files/traditional_boat.pdf",
    description: "A small boat. Not recommended for practical use."
    },
    {title: "Grasshopper",
    category: "Animal",
    style: "Traditional",
    difficulty: 2,
    finished_image_url: "https://origamiusa.org/files/styles/diagrams_image/public/diagrams_pdf_image/grasshopper.jpg?itok=WI0haQM6",
    instruction_image_url: "https://origamiusa.org/files/grasshopper.pdf",
    description: "A grasshopper. Ironically, it can't hop, nor is it made of grass."
    },
    {title: "Box",
    category: "Object",
    style: "Traditional",
    difficulty: 1,
    finished_image_url: "https://origamiusa.org/files/styles/diagrams_image/public/diagrams_pdf_image/atsushi-box-traditional.jpg?itok=ndbeVIsI",
    instruction_image_url: "https://origamiusa.org/files/atsushi-box-traditional.pdf",
    description: "A small box for storing small things."
    }
]

#Create origami instances based on the above details
puts "Seeding origamis....."
origamis.each do |o|
    Origami.create(o)
end

origami_ids = Origami.all.map{|o| o.id}

#Add origamis to basket
puts "Adding to basket....."
Basket.create(user_id: u1.id, origami_id: origami_ids.sample)
Basket.create(user_id: u1.id, origami_id: origami_ids.sample)
Basket.create(user_id: u2.id, origami_id: origami_ids.sample)
Basket.create(user_id: u2.id, origami_id: origami_ids.sample)

#Array with post details
posts = [
    {title: "My Experience Making My First Origami.",
    content: "I really enjoyed making my first completed piece. It was really tough at first. I had to start over 3 times! But, now I have a cute cat to keep me company when I'm lonely.",
    user_id: u1.id,
    origami_id: Origami.first.id
    },
    {title: "Don't Use The Cup Origami to Drink Liquids!",
    content: "Today I made a cup origami (it went very well! I recommend trying it). I was so proud of myself for getting it done on the first try, that I decided to have a celebratory bourbon. I thought, 'What better vessel than the one I just created?' Well, it was not a good idea. The bourbon leaked through and then I had to clean it up, and my origami was ruined. I didn't feel much like celebrating after that, but I had twice the amount of bourbon.",
    user_id: u2.id,
    origami_id: Origami.last.id
    }
]

#Create posts
puts "Seeding posts....."
posts.each do |p|
    Post.create(p)
end

puts "-" * 10
puts "Done!"