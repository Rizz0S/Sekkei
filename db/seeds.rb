User.destroy_all
Origami.destroy_all
Basket.destroy_all
Post.destroy_all


#Create a few user instances
puts "Seeding users...."
u1 = User.create(name: "Summer", username: "summeroo", password: "meep123", bio: "Folding paper puts me in a tranquil state.")
u2 = User.create(name: "Monsur", username: "mk17173n", password: "spiderman101", bio: "I love comic books and making origami!")

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
    finished_image_url: "https://origamiusa.org/files/styles/diagrams_image/public/diagrams_pdf_image/atsushi-cup.jpg?itok=LJ66H3cI",
    instruction_image_url: "https://origamiusa.org/files/iris.pdf",
    description: "An iris flower head."
    },
    {title: "Cup",
    category: "Object",
    style: "Traditional",
    difficulty: 2,
    finished_image_url: "https://origamiusa.org/files/diagrams_pdf_image/traditional_cat_thumb.png",
    instruction_image_url: "https://origamiusa.org/files/atsushi-cup.pdf",
    description: "A small cup."
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