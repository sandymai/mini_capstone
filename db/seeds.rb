Supplier.create!(name: "PetsSmart", email: "petsmart@email.com", phone_number: "000-000-0000")
Supplier.create!(name: "PetCo", email: "petco@email.com", phone_number: "999-999-9999")
Supplier.create!(name: "PetLand", email: "petland@email.com", phone_number: "888-888-8888")


Product.create!({supplier_id: 3, name: "Dog", price: 500, description: "brown and playful"})
Product.create!({supplier_id: 1, name: "Cat", price: 100, description: "orange and fat"})
Product.create!({supplier_id: 3, name: "Parrot", price: 1000, description: "This bird is blue, green and yellow. Teach it a few words and it will also talk back to you."})
Product.create!({supplier_id: 2, name: "Hamster", price: 10, description: "This little fella is easy to take care of and nocturnal."})
Product.create!({supplier_id: 1, name: "Chamleon", price: 75, description: "These species come in a range of colors, and many species have the ability to change color."})


Image.create!({product_id: 1, url: "https://cdn1.medicalnewstoday.com/content/images/articles/322/322868/golden-retriever-puppy.jpg"})
Image.create!({product_id: 1, url: "https://smilingpaws.files.wordpress.com/2013/12/brown-puppy-blue-eyes.jpg"})

Image.create!({product_id: 2, url: "https://www.rxvitamins.com/rxvitaminsforpet/wp-content/uploads/2018/12/FatCat-1024x576.jpg"})
Image.create!({product_id: 3, url: "https://d3pz1jifuab5zg.cloudfront.net/2015/04/12163111/parrot-feet.jpg"})
Image.create!({product_id: 4, url: "https://www.petmd.com/sites/default/files/CANS_HamsterSign_729603697%20(1).jpg"})
Image.create!({product_id: 5, url: "https://cdn0.wideopenpets.com/wp-content/uploads/2016/01/rsz_chameleon-03-770x405.jpg"})
