
User.delete_all
User.create!(username: 'Guest', password: 'guestpassword')

300.times do
  User.create(
    username: Faker::Internet.user_name,
    password: 'userpassword'
  )
end

user_count = User.all.count

Category.delete_all

breakfast = Category.create!(title: 'Breakfast')
appetizers = Category.create!(title: 'Appetizers')
desserts = Category.create!(title: 'Desserts')
vegetarian = Category.create!(title: 'Vegetarian')
meat = Category.create!(title: 'Meat')
seafood = Category.create!(title: 'Seafood')

seafood_img = Image.create!(url: 'http://res.cloudinary.com/wkdal720/image/upload/v1473346607/seafood_gvpnfz.jpg')
seafood_img.imageable = seafood
seafood_img.save!

appetizer_img = Image.create!(url: 'http://res.cloudinary.com/wkdal720/image/upload/v1472664911/Appetizers_rw1fgb.jpg')
appetizer_img.imageable = appetizers
appetizer_img.save!

breakfast_img = Image.create!(url: 'http://res.cloudinary.com/wkdal720/image/upload/v1472664911/breakfast_v5z2ti.jpg')
breakfast_img.imageable = breakfast
breakfast_img.save!

vegetarian_img = Image.create!(url: 'http://res.cloudinary.com/wkdal720/image/upload/v1473106985/vegetarian_wxqzop.jpg')
vegetarian_img.imageable = vegetarian
vegetarian_img.save!

meat_img = Image.create!(url: 'http://res.cloudinary.com/wkdal720/image/upload/v1472664912/Maindish_pkxhrw.jpg')
meat_img.imageable = meat
meat_img.save!

desserts_img = Image.create!(url: 'http://res.cloudinary.com/wkdal720/image/upload/v1472664911/Desserts_r0fabf.jpg')
desserts_img.imageable = desserts
desserts_img.save!

Recipe.delete_all

Comment.delete_all


# http://allrecipes.com/recipe/20156/clone-of-a-cinnabon/?internalSource=staff%20pick&referringId=78&referringContentType=recipe%20hub&clickId=cardslot%208
Recipe.create!(
  title: 'Clone of a Cinnabon',
  description: 'You have got to try these. The first time I made them, I thought of how much money I could save by making my own!',
  ingredients: '1 cup warm milk (110 degrees F/45 degrees C)#@!2 eggs, room temperature#@!1/3 cup margarine, melted#@!4 1/2 cups bread flour#@!1 teaspoon salt#@!1/2 cup white sugar#@!2 1/2 teaspoons bread machine yeast#@!2 1/2 teaspoons bread machine yeast#@!2 1/2 tablespoons ground cinnamon#@!1/3 cup butter, softened#@!1 (3 ounce) package cream cheese, softened#@!1 1/2 cups confectioners\' sugar#@!1/2 teaspoon vanilla extract#@!1/8 teaspoon salt',
  user_id: (1..user_count).to_a.sample,
  category_id: 1,
  prep_time: 20,
  cook_time: 15,
  steps_attributes: [{
    body: '0Place ingredients in the pan of the bread machine in the order recommended by the manufacturer. Select dough cycle; press Start.',
    order: 0
  }, {
    body: '0After the dough has doubled in size turn it out onto a lightly floured surface, cover and let rest for 10 minutes. In a small bowl, combine brown sugar and cinnamon.',
    order: 1
  }, {
    body: '0Roll dough into a 16x21-inch rectangle. Spread dough with 1/3 cup butter and sprinkle evenly with sugar/cinnamon mixture. Roll up dough and cut into 12 rolls. Place rolls in a lightly greased 9x13 inch baking pan. Cover and let rise until nearly doubled, about 30 minutes. Meanwhile, preheat oven to 400 degrees F (200 degrees C).',
    order: 2
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473106985/3839539_ccye8h.jpg',
    order: 3
  }, {
    body: '0Bake rolls in preheated oven until golden brown, about 15 minutes. While rolls are baking, beat together cream cheese, 1/4 cup butter, confectioners\' sugar, vanilla extract and salt. Spread frosting on warm rolls before serving.',
    order: 4
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473351782/cinnamon-rolls_dxvcim.jpg',
    order: 5
    }
  ]
)
Comment.create!(recipe_id: 1, user_id: (1..user_count).to_a.sample, content: "I made these for a girls only brunch & they were gobbled up!! Fabulous!")
Comment.create!(recipe_id: 1, user_id: (1..user_count).to_a.sample, content: "These are wonderfull! Not difficult to make and they are YUMMY. Highly reccomend this recipe. I would like to know if these are okay to refigerate overnight before placing in the oven.")
Comment.create!(recipe_id: 1, user_id: (1..user_count).to_a.sample, content: "This really does taste like a cinnabon. I thought that they were great and my husband even likes them!")
Comment.create!(recipe_id: 1, user_id: (1..user_count).to_a.sample, content: "Scrumptious!! I doubled the frosting recipe :)")
Comment.create!(recipe_id: 1, user_id: (1..user_count).to_a.sample, content: "I had no idea I could make something so good! The bread machine really makes this easy and they are delicious. Marsha, thanks for sharing such a great recipe.")
Comment.create!(recipe_id: 1, user_id: (1..user_count).to_a.sample, content: "This recipe is fabulous. Will definately make again!")

# http://allrecipes.com/recipe/17681/belgian-waffles/?internalSource=staff%20pick&referringId=78&referringContentType=recipe%20hub&clickId=cardslot%205
Recipe.create!(
  title: 'Belgian Waffles',
  description: 'Belgian waffles are tender and flavorful waffles made with yeast. They\'re great topped with butter, whipped cream and fresh fruit.',
  ingredients: '1 (.25 ounce) package active dry yeast#@!1/4 cup warm milk (110 degrees F/45 degrees C)#@!3 egg yolks#@!2 3/4 cups warm milk (110 degrees F/45 degrees C)#@!3/4 cup butter, melted and cooled to lukewarm#@!1/2 cup white sugar#@!1 1/2 teaspoons salt#@!2 teaspoons vanilla extract#@!4 cups all-purpose flour#@!3 egg whites',
  user_id: 1,
  category_id: 1,
  prep_time: 15,
  cook_time: 20,
  steps_attributes: [
    {
    body: '0In a small bowl, dissolve yeast in 1/4 cup warm milk. Let stand until creamy, about 10 minutes.',
    order: 0
  },
  {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1472849864/4_aovzeu.jpg',
    order: 1
  },
  {
    body: '0In a large bowl, whisk together the egg yolks, 1/4 cup of the warm milk and the melted butter. Stir in the yeast mixture, sugar, salt and vanilla. Stir in the remaining 2 1/2 cups milk alternately with the flour, ending with the flour. Beat the egg whites until they form soft peaks; fold into the batter. Cover the bowl tightly with plastic wrap. Let rise in a warm place until doubled in volume, about 1 hour.',
    order: 2
  },
  {
    body: '0Preheat the waffle iron. Brush with oil and spoon about 1/2 cup (or as recommended by manufacturer) onto center of iron. Close the lid and bake until it stops steaming and the waffle is golden brown. Serve immediately or keep warm in 200 degree oven.',
    order: 3
  },
  {
    body: '0Bake for 35 minutes in the preheated oven, until golden brown. Dust with confectioners\' sugar before serving.',
    order: 4
  },
  {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1472849746/2_qpd1yx.jpg',
    order: 5
  }]
)

Comment.create!(recipe_id: 2, user_id: (2..user_count).to_a.sample, content: "Make the night before.....they turn out perfectly.")
Comment.create!(recipe_id: 2, user_id: (2..user_count).to_a.sample, content: "I loved this recipe! True belgian waffles are a yeast batter, and this one is very genuine. My only gripe is that it makes a lot of dishes (yeast, butter, milk, mixing bowl, egg whites).")
Comment.create!(recipe_id: 2, user_id: (2..user_count).to_a.sample, content: "FINALLY a recipe worthy of a five star rating! I have made these waffles several times. For time purposes, I prefer preparing the batter the night before versus the morning of. ")
Comment.create!(recipe_id: 2, user_id: (2..user_count).to_a.sample, content: "I made these delicious waffles for our woman's retreat breakfast at church, and those women loved them.")
Comment.create!(recipe_id: 2, user_id: (2..user_count).to_a.sample, content: "These are good when you first make them, but if you leave the batter in the fridge overnight and then make them they are DIVINE. Such a difference in taste. It's amazing!")
Comment.create!(recipe_id: 2, user_id: (2..user_count).to_a.sample, content: "These were awesome! One waffle is so filling! I made this the night before and did a cold rise in the fridge. I would definitely recommend this unless you have time to wait.")
Comment.create!(recipe_id: 2, user_id: (2..user_count).to_a.sample, content: "This is EXACTLY the type of waffle I was looking for! Light and fluffy, yet lightly crispy on the outside. Soooo yummy!")
Comment.create!(recipe_id: 2, user_id: (2..user_count).to_a.sample, content: "This was my first attempt at Belgian Waffles and the recipe looked pretty simple in case I wasn't very awake in the morning. :) I made them as directed and they were a hit.")
Comment.create!(recipe_id: 2, user_id: (2..user_count).to_a.sample, content: "I followed the recipe to the letter except that I made it the night before and let it rise in the fridge. These waffles are awesome!")


# http://allrecipes.com/recipe/21014/good-old-fashioned-pancakes/?internalSource=hub%20recipe&referringId=151&referringContentType=recipe%20hub&clickId=cardslot%2013
Recipe.create!(
  title: 'Good Old Fashioned Pancakes',
  description: 'This is a great recipe that I found in my Grandma\'s recipe book. Judging from the weathered look of this recipe card, this was a family favorite.',
  ingredients: '1 1/2 cups all-purpose flour#@!3 1/2 teaspoons baking powder#@!1 teaspoon salt#@!1 tablespoon white sugar#@!1 1/4 cups milk#@!1 egg#@!3 tablespoons melted butter',
  user_id: (1..user_count).to_a.sample,
  category_id: 1,
  prep_time: 5,
  cook_time: 15,
  steps_attributes: [
    {
    body: '0In a large bowl, sift together the flour, baking powder, salt and sugar. Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.',
    order: 0
  },
  {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1472849971/5_zhwpnx.jpg',
    order: 2
  },
  {
    body: '0Heat a lightly oiled griddle or frying pan over medium high heat. Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.',
    order: 1
  },
  {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1472849746/3_asx6om.jpg',
    order: 3
  }
  ]
)

Comment.create!(recipe_id: 3, user_id: (1..user_count).to_a.sample, content: "Like most of the others I only used 3/4 tsp. salt and added 1 tsp. vanilla. These are the best pancakes I've ever made at home, thanks for the recipe!!")
Comment.create!(recipe_id: 3, user_id: (1..user_count).to_a.sample, content: "This had WAY too much salt! Next time I will only use 1/4 - 1/2 tsp. at most!")
Comment.create!(recipe_id: 3, user_id: (1..user_count).to_a.sample, content: "These are great and easy. A lot better than the ones from a box. I will continue to make them for sure. They were light and fluffy with a good taste.")
Comment.create!(recipe_id: 3, user_id: (1..user_count).to_a.sample, content: "Judging by the other comments, it seems we may have done something wrong because we couldn't even bring ourselves to eat these. The aftertaste was horrible. Too much baking powder?")
Comment.create!(recipe_id: 3, user_id: (1..user_count).to_a.sample, content: "These are amazing made exactly as the recipe calls. I added 1tsp vanilla and chocolate chips and they turned out fantastic!")
Comment.create!(recipe_id: 3, user_id: (1..user_count).to_a.sample, content: "I don't understand why people make variations to a recipe and then give it a poor rating after they've ruined it. It is unfair to the poster. ")
Comment.create!(recipe_id: 3, user_id: (1..user_count).to_a.sample, content: "These pancakes are awesome. Literally the best pancakes I have ever eaten. I make extra because even without syrup, they are yummy to nibble on later. ")
Comment.create!(recipe_id: 3, user_id: (1..user_count).to_a.sample, content: "Good basic recipe with the exception of the consistency. If you follow this recipe to the letter the batter is much to thick and you'll end up with 2\" thick cakes.")
Comment.create!(recipe_id: 3, user_id: (1..user_count).to_a.sample, content: "These are simply delicious. Quick and easy to make. Left overs store well n the frig. I am single. I make the whole recipe and am good for the week.")



# http://allrecipes.com/recipe/76278/orange-pecan-french-toast/?internalSource=staff%20pick&referringId=78&referringContentType=recipe%20hub&clickId=cardslot%202
Recipe.create!(
  title: 'Orange Pecan French Toast',
  description: 'My husband and I were vacationing recently and had this lovely French toast at a bed and breakfast. When we came back home, I kept missing it so I called them up and requested it. They actually gave me the recipe over the phone! I generally halve the recipe for my husband and I, and bake it in an 8 inch square pan. Reheats well in the toaster oven. I served it to my in-laws recently and they loved it. Serve with a little sweetened whipped cream and berries!',
  ingredients: '1 cup packed brown sugar#@!1/3 cup butter- melted#@!2 tablespoons corn syrup#@!1/3 cup chopped pecans#@!12 (3/4 inch thick) slices French bread#@!1 teaspoon grated orange zest#@!1 cup fresh orange juice#@!1/2 cup 2% milk#@!3 tablespoons white sugar#@!1 teaspoon ground cinnamon#@!1 teaspoon vanilla extract#@!3 egg whites#@!2 eggs#@!1 tablespoon confectioners\' sugar for dusting',
  user_id: (1..user_count).to_a.sample,
  category_id: 1,
  prep_time: 20,
  cook_time: 35,
  steps_attributes: [
    {
    body: '0In a small bowl, stir together the brown sugar, melted butter, and corn syrup. Pour into a greased 9x13 inch baking dish, and spread evenly. Sprinkle pecans over the sugar mixture. Arrange the bread slices in the bottom of the dish so they are in a snug single layer.',
    order: 0
  },
  {
    body: '0In a medium bowl, whisk together the orange zest, orange juice, milk, sugar, cinnamon, vanilla, egg whites, and eggs. Pour this mixture over the bread, pressing on the bread slices to help absorb the liquid. Cover and refrigerate for at least one hour, or overnight.',
    order: 1
  },
  {
    body: '0Preheat the oven to 350 degrees F (175 degrees C ). Remove the cover from the baking dish, and let stand for 20 minutes at room temperature.',
    order: 2
  },
  {
    body: '0Bake for 35 minutes in the preheated oven, until golden brown. Dust with confectioners\' sugar before serving.',
    order: 3
  },
  {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1472849746/1_c4ohzr.jpg',
    order: 4
  }]
)

Comment.create!(recipe_id: 4, user_id: (1..user_count).to_a.sample, content: "This is a great variation to your breakfast menu. I prepared the night before and then baked in the morning. It would go great with a cream cheese frosting!")
Comment.create!(recipe_id: 4, user_id: (1..user_count).to_a.sample, content: "This recipe is phenomenal. One tip is to either use stale bread or crisp it up in the oven before hand. My family adores it!")
Comment.create!(recipe_id: 4, user_id: (1..user_count).to_a.sample, content: "AMAZING! Would make again in a heartbeat, no modifications needed to the recipe in my opinion!")
Comment.create!(recipe_id: 4, user_id: (1..user_count).to_a.sample, content: "I made this for Christmas brunch. Everyone loved it! Almost all went back for seconds. I enjoyed a slice that was left over the next day. Definitely will make again.")
Comment.create!(recipe_id: 4, user_id: (1..user_count).to_a.sample, content: "very easy, very very yummy! I make it for breakfast for dinner once a month!")
Comment.create!(recipe_id: 4, user_id: (1..user_count).to_a.sample, content: "It was a hit at our brunch. I might tweak it and use a little less sugar, but otherwise it was perfect.")
Comment.create!(recipe_id: 4, user_id: (1..user_count).to_a.sample, content: "Delicious! I used Italian bread for bigger slices, and served with raspberries and whipped cream.")
Comment.create!(recipe_id: 4, user_id: (1..user_count).to_a.sample, content: "I cut the sugar in half and it was still deliciously sweet. I thought it was just right! yummy!")
Comment.create!(recipe_id: 4, user_id: (1..user_count).to_a.sample, content: "This recipe is amazing! The neat thing about it is that you can make it ahead of time (like overnight) and it still tastes great!")

# http://allrecipes.com/recipe/235095/easy-rumaki-with-pineapple/?internalSource=staff%20pick&referringId=76&referringContentType=recipe%20hub&clickId=cardslot%202
Recipe.create!(
  title: 'Easy Rumaki with Pineapple',
  description: 'This combines the crunchiness of bacon and water chestnuts with the wonderful flavors of pineapple. We make it right before watching football games, but it doesn\'t last long.',
  ingredients: 'cooking spray#@!24 (1 inch) cubes fresh pineapple#@!24 water chestnut slices#@!8 thick-cut bacon slices, cut crosswise into 3 pieces#@!24 toothpicks#@!1/2 cup low-fat sesame-ginger salad dressing#@!1 tablespoon chopped green onion, or to taste',
  user_id: (1..user_count).to_a.sample,
  category_id: 2,
  prep_time: 20,
  cook_time: 20,
  steps_attributes: [{
    body: '0Preheat oven to 375 degrees F (190 degrees C). Line the bottom section of a broiler pan with aluminum foil, top with the broiler rack, and spray rack with cooking spray.',
    order: 0
  }, {
    body: '0Place a water chestnut slice atop each pineapple cube; wrap each with 1 bacon slice, securing with a toothpick. Arrange wrapped pineapple on the prepared broiler rack.',
    order: 1
  }, {
    body: '0Bake in the preheated oven for 7 minutes; turn and continue baking until bacon is almost crisp, about 8 more minutes. Brush rumaki with sesame-ginger dressing and continue baking until bacon is crisp, about 5 more minutes. Garnish rumaki with green onion.',
    order: 2
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473351782/rumaki_v7u2hy.jpg',
    order: 3
  }
  ]
)

Comment.create!(recipe_id: 5, user_id: (1..user_count).to_a.sample, content: "Wonderful! Made a batch of these for Sunday NFL day for hubby and they were a hit!")
Comment.create!(recipe_id: 5, user_id: (1..user_count).to_a.sample, content: "I don't like pineapple or water chestnuts but these were delicious!")
Comment.create!(recipe_id: 5, user_id: (1..user_count).to_a.sample, content: "This was a hit, I will make it again.")
Comment.create!(recipe_id: 5, user_id: (1..user_count).to_a.sample, content: "YUMMY! Big hit at guys ice fishin' weekend! I agree with the 1st reviewer that an oven at 425 worked well. I like my bacon crispy, so it seemed the higher temp worked better.")
Comment.create!(recipe_id: 5, user_id: (1..user_count).to_a.sample, content: "These are not just for appetizers and snacks. The 2 of us had them for dinner, no left overs. I fixed some rice with teriyaki sauce and chicken broth to go with them.")
Comment.create!(recipe_id: 5, user_id: (1..user_count).to_a.sample, content: "These flavors together is magical. Agree that 425° is better. I think I'll use the grill next time for more even crispness.")
Comment.create!(recipe_id: 5, user_id: (1..user_count).to_a.sample, content: "I increased the temp to 425 as others suggested, but I made one mistake. I used thin sliced bacon thinking they would crisp up faster, but some of them fell apart!")


# http://allrecipes.com/recipe/216909/stuffed-jalapeno-firecrackers/?internalSource=hn_carousel%2002_Stuffed%20Jalapeno%20Firecrackers&referringId=76&referringContentType=recipe%20hub&referringPosition=carousel%2002
Recipe.create!(
  title: 'Stuffed Jalapeno Firecrackers',
  description: 'This recipe came about after years of competition with family and friends over the perfect stuffed jalapeno. Bring your tissues because these are HOT! Goes well with Summer Beer I from this site.',
  ingredients: '12 jalapeno peppers, halved lengthwise#@!1 (8 ounce) package cream cheese, softened#@!Cajun seasoning, or to taste#@!12 slices jalapeno bacon, cut in half#@!toothpicks',
  user_id: 1,
  category_id: 2,
  prep_time: 15,
  cook_time: 20,
  steps_attributes: [{
    body: '0Preheat the oven\'s broiler and set the oven rack about 6 inches from the heat source.',
    order:0
  },{
    body: '0Fill the jalapeno peppers with cream cheese. Sprinkle the Cajun seasoning on top, then wrap each stuffed jalapeno with a slice of bacon. Secure with a toothpick. Arrange the wrapped jalapeno peppers in a single layer, face down on a broiler rack.',
    order:1
  },{
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473107818/861416_npbyrz.jpg',
    order:2
  },{
    body: '0Broil in the preheated oven until the bacon becomes crisp, 8 to 15 minutes on each side.',
    order:3
  },{
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473107817/803231_qc5fsq.jpg',
    order:4
  }
  ]
)

Comment.create!(recipe_id: 6, user_id: (2..user_count).to_a.sample, content: "Here in Texas it seems every store has the jalapeno bacon. If you cannot find it at your local grocer you can purchase the bacon online")
Comment.create!(recipe_id: 6, user_id: (2..user_count).to_a.sample, content: "I've made these for years. Everytime I make them they are the first app to go. I haven't tried with the cajun seasoning but will next time.")
Comment.create!(recipe_id: 6, user_id: (2..user_count).to_a.sample, content: "Fantastic twist to the usual jalapeno popper. After reading reviews I pulled it off like this: Did all the recommended prep plus baked the jalapenos for 15 minutes at 350 to lessen the heat.")
Comment.create!(recipe_id: 6, user_id: (2..user_count).to_a.sample, content: "hese are fantastic!! I also added some chopped pineapple and garlic powder to the cream cheese. Everyone loved them! Also added a sprinkle of brown sugar over the bacon for extra yum.")
Comment.create!(recipe_id: 6, user_id: (2..user_count).to_a.sample, content: "OK, rule of thumb, the smaller the Jalapeno, the hotter it is. Use gloves to seed the peppers, else you get the oils on your hands and hurt for some time.")
Comment.create!(recipe_id: 6, user_id: (2..user_count).to_a.sample, content: "My family loves this. I find is faster to just lay and push the bacon into the cream cheese a little to make it stick on top, that way the bacon is crisp all over.")



# http://allrecipes.com/recipe/15184/mouth-watering-stuffed-mushrooms/?internalSource=staff%20pick&referringId=76&referringContentType=recipe%20hub&clickId=cardslot%203
Recipe.create!(
  title: 'Mouth-Watering Stuffed Mushrooms',
  description: 'These delicious mushrooms taste just like restaurant-style stuffed mushrooms and are my guy\'s absolute favorite.',
  ingredients: '12 whole fresh mushrooms#@!1 tablespoon vegetable oil#@!1 tablespoon minced garlic#@!1 (8 ounce) package cream cheese, softened#@!1/4 cup grated Parmesan cheese#@!1/4 teaspoon ground black pepper#@!1/4 teaspoon onion powder#@!1/4 teaspoon ground cayenne pepper',
  user_id: (1..user_count).to_a.sample,
  category_id: 2,
  prep_time: 25,
  cook_time: 20,
  steps_attributes: [{
    body: '0Preheat oven to 350 degrees F (175 degrees C). Spray a baking sheet with cooking spray. Clean mushrooms with a damp paper towel. Carefully break off stems. Chop stems extremely fine, discarding tough end of stems.',
    order:0
  }, {
    body: '0Heat oil in a large skillet over medium heat. Add garlic and chopped mushroom stems to the skillet. Fry until any moisture has disappeared, taking care not to burn garlic. Set aside to cool.',
    order:1
  }, {
    body: '0When garlic and mushroom mixture is no longer hot, stir in cream cheese, Parmesan cheese, black pepper, onion powder and cayenne pepper. Mixture should be very thick. Using a little spoon, fill each mushroom cap with a generous amount of stuffing. Arrange the mushroom caps on prepared cookie sheet.',
    order:2
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473108145/2331495_iqwx1i.jpg',
    order:3
  }, {
    body: '0Bake for 20 minutes in the preheated oven, or until the mushrooms are piping hot and liquid starts to form under caps.',
    order:4
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473108145/414837_zafytk.jpg',
    order:5
  }
  ]
)

Comment.create!(recipe_id: 7, user_id: (1..user_count).to_a.sample, content: "I've made these many times and everyone loves them. They are not time consuming at all and can be made up two days before needed.")
Comment.create!(recipe_id: 7, user_id: (1..user_count).to_a.sample, content: "This is a favorite recipe that I have made several times and I never have any leftovers. Even my young son loves the flavorfull filling.")
Comment.create!(recipe_id: 7, user_id: (1..user_count).to_a.sample, content: "Great! A little time consuming, but worth it.")
Comment.create!(recipe_id: 7, user_id: (1..user_count).to_a.sample, content: "Wow, these are ever so good exactly as written!!!")
Comment.create!(recipe_id: 7, user_id: (1..user_count).to_a.sample, content: "This was my first time making stuffed mushrooms and after reading several of the reviews I decided on how I would make mine.")
Comment.create!(recipe_id: 7, user_id: (1..user_count).to_a.sample, content: "I made for Christmas dinner appetizer and they were YUMMY! But i also read a lot of the reviews and took some of the advice (and left some).")
Comment.create!(recipe_id: 7, user_id: (1..user_count).to_a.sample, content: "Excellent recipe. I doubled the filling and used 24 oz fresh mushrooms and it filled them almost perfectly.")
Comment.create!(recipe_id: 7, user_id: (1..user_count).to_a.sample, content: "I have made these many times, and they always disappear so fast! What a great recipe.")


# http://allrecipes.com/recipe/212896/caprese-appetizer/?internalSource=hub%20recipe&referringContentType=search%20results&clickId=cardslot%203
Recipe.create!(
  title: 'Caprese Appetizer',
  description: 'Caprese salad skewers. Perfect for holiday parties.',
  ingredients: '20 grape tomatoes#@!10 ounces mozzarella cheese, cubed#@!2 tablespoons extra virgin olive oil#@!2 tablespoons fresh basil leaves, chopped#@!1 pinch salt#@!1 pinch ground black pepper#@!20 toothpicks',
  user_id: (1..user_count).to_a.sample,
  category_id: 2,
  prep_time: 15,
  cook_time: 15,
  steps_attributes: [{
    body: '0Toss tomatoes, mozzarella cheese, olive oil, basil, salt, and pepper together in a bowl until well coated. Skewer one tomato and one piece of mozzarella cheese on each toothpick.',
    order:0
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473108523/2411673_f9fouh.jpg',
    order:1
  }
  ]
)

Comment.create!(recipe_id: 8, user_id: (1..user_count).to_a.sample, content: "Delicious! I bought boconccini (little fresh mozzarella balls) and I marinated them for 2 days in garlic powder, dried basil and oregano and salt and pepper.")
Comment.create!(recipe_id: 8, user_id: (1..user_count).to_a.sample, content: "I haven't made this exact recipe but one similar. I find it's easier to eat if you halve the grape tomatoes and put the cubed cheese with the half piece.")
Comment.create!(recipe_id: 8, user_id: (1..user_count).to_a.sample, content: "This is one of my favorite things to eat, but I had a little balsamic vinegar to the mixture. Gives it just the right amount of kick!")
Comment.create!(recipe_id: 8, user_id: (1..user_count).to_a.sample, content: "This was very good! I skewered half a grape tomato, a piece of fresh mozzarella cheese, a piece of basil and then the second half of the tomato.")
Comment.create!(recipe_id: 8, user_id: (1..user_count).to_a.sample, content: "I buy the mozzarella balls that are in a herbed oil in the specialty cheese case of my grocery store. Make the skewers & pour the oil over them.")
Comment.create!(recipe_id: 8, user_id: (1..user_count).to_a.sample, content: "My sister-in-law made these for Christmas. Instead of chopping the basil she threaded a leaf between the cheese and tomato.")
Comment.create!(recipe_id: 8, user_id: (1..user_count).to_a.sample, content: "These have been the highlight of my summer! I've taken them to parties and love them the next day for lunch or with a sandwich or salad.")

# http://allrecipes.com/recipe/237116/waldorfs-sour-cream-cheesecake/?internalSource=hn_carousel%2002_Waldorf%27s%20Sour%20Cream%20Cheesecake&referringId=79&referringContentType=recipe%20hub&referringPosition=carousel%2002
Recipe.create!(
  title: 'Waldorf\'s Sour Cream Cheesecake',
  description: 'A wonderful and easy cheesecake recipe my mother-in-law made for the holidays and special occasions.',
  ingredients: '7 ounces vanilla wafers, crushed#@! 1/2 cup margarine, melted#@!2 tablespoons white sugar#@!1 pinch ground cinnamon#@!2 (8 ounce) packages cream cheese, softened#@!1 cup white sugar#@!2 tablespoons lemon juice#@!4 eggs#@!1 pint sour cream#@!2 tablespoons white sugar#@!1 teaspoon vanilla extract',
  user_id: (2..user_count).to_a.sample,
  category_id: 3,
  prep_time: 30,
  cook_time: 40,
  steps_attributes: [{
    body: '0Preheat oven to 375 degrees F (190 degrees C).',
    order:0
  }, {
    body: '0Mix vanilla wafers, margarine, 2 tablespoons sugar, and cinnamon together in a bowl; press into the bottom of a 9x13-inch baking dish.',
    order:1
  }, {
    body: '0Bake in the preheated oven until lightly browned, about 10 minutes.',
    order:2
  }, {
    body: '0Beat the two 8-ounce packages and 3-ounce package cream cheese with 1 cup sugar and lemon juice until smooth. Beat eggs, 1 at a time, into cream cheese mixture, stirring well after each addition; spread over crust.',
    order:3
  }, {
    body: '0Bake in the preheated oven until middle of cheesecake is set, 25 to 30 minutes; cool for 10 minutes.',
    order:4
  }, {
    body: '0Increase oven temperature to 475 degrees F (245 degrees C).',
    order:5
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473108941/2504118_ghminv.jpg',
    order:6
  }, {
    body: '0Mix sour cream, 2 tablespoons white sugar, and vanilla extract together in a bowl until creamy; pour over cheesecake.',
    order:7
  }, {
    body: '0Bake until topping is set, about 5 minutes. Cool cheesecake to room temperature and refrigerate until serving.',
    order:8
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473351782/cheesecake_pyq5al.jpg',
    order:9
  }
  ]
)

Comment.create!(recipe_id: 9, user_id: (1..user_count).to_a.sample, content: "FANTASTIC! I was leary of using 1/2 cup of margarine in the crust, and it was pretty oily when I was pressing it into the pan, but it came out great.")
Comment.create!(recipe_id: 9, user_id: (1..user_count).to_a.sample, content: "Wooooow goood")
Comment.create!(recipe_id: 9, user_id: (1..user_count).to_a.sample, content: "This cheesecake was delicious! But one thing I would add, when you're beating the filling, use a low setting. I put it on high and once it was done, the texture was a bit odd and spongey.")
Comment.create!(recipe_id: 9, user_id: (1..user_count).to_a.sample, content: "Terrific! I wouldn't change a thing. I didn't even have an opportunity to take a picture because my family devoured it too soon.")
Comment.create!(recipe_id: 9, user_id: (1..user_count).to_a.sample, content: "This recipe had me second guessing it, but it was delicious! Lots of raving from friends who tried it.")
Comment.create!(recipe_id: 9, user_id: (1..user_count).to_a.sample, content: "We made this before for family, and everyone loved it. Will make it again soon.")
Comment.create!(recipe_id: 9, user_id: (1..user_count).to_a.sample, content: "Absolutely a crowd pleaser and rather easy to make. Followed the recipe except I used a 10\" spring pan with water bath under (as precaution based on other review).")
Comment.create!(recipe_id: 9, user_id: (1..user_count).to_a.sample, content: "Really delicious and wonderful size for a crowd. I made it in a glass 9 by 13 inch pan and didn't have trouble with cracks or flaws like I have with some other cheesecakes.")



# http://allrecipes.com/recipe/25037/best-big-fat-chewy-chocolate-chip-cookie/?internalSource=hub%20recipe&referringId=79&referringContentType=recipe%20hub&clickId=cardslot%2014
Recipe.create!(
  title: 'Best Big, Fat, Chewy Chocolate Chip Cookie',
  description: 'These cookies are the pinnacle of perfection! If you want a big, fat, chewy cookie like the kind you see at bakeries and specialty shops, then these are the cookies for you!',
  ingredients: '2 cups all-purpose flour#@!1/2 teaspoon baking soda#@!1/2 teaspoon salt#@!3/4 cup unsalted butter, melted#@!1 cup packed brown sugar#@!1/2 cup white sugar#@!1 tablespoon vanilla extract 1 egg#@!1 egg yolk#@!2 cups semisweet chocolate chips',
  user_id: 1,
  category_id: 3,
  prep_time: 10,
  cook_time: 15,
  steps_attributes: [{
    body: '0Preheat the oven to 325 degrees F (165 degrees C). Grease cookie sheets or line with parchment paper.',
    order:0
  }, {
    body: '0Sift together the flour, baking soda and salt; set aside.',
    order:1
  }, {
    body: '0In a medium bowl, cream together the melted butter, brown sugar and white sugar until well blended. Beat in the vanilla, egg, and egg yolk until light and creamy. Mix in the sifted ingredients until just blended. Stir in the chocolate chips by hand using a wooden spoon. Drop cookie dough 1/4 cup at a time onto the prepared cookie sheets. Cookies should be about 3 inches apart.',
    order:2
  }, {
    body: '0Bake for 15 to 17 minutes in the preheated oven, or until the edges are lightly toasted. Cool on baking sheets for a few minutes before transferring to wire racks to cool completely.',
    order:3
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473109281/1107530_bnjcdk.jpg',
    order:4
  }
  ]
)

Comment.create!(recipe_id: 10, user_id: (2..user_count).to_a.sample, content: "We thought these were great. It's not the only chocolate chip cookie recipe I'll use, but when you want a \"big, fat, chewy cookie,\" this is awesome.")
Comment.create!(recipe_id: 10, user_id: (2..user_count).to_a.sample, content: "I have tried quite a few chocolate chip cookie recipes, and this is by far the BEST! Don't be alarmed by the reviewers who say theirs turned out flat.")
Comment.create!(recipe_id: 10, user_id: (2..user_count).to_a.sample, content: "Update: Learn from my mistake...Use MARGARINE rather than butter in this recipe if you want a thick cookie. Wow! This cookie is absolutely heavenly!")
Comment.create!(recipe_id: 10, user_id: (2..user_count).to_a.sample, content: "W-O-W!!!! I'm speechless. Just when I was beginning to give up my faith in this website.")
Comment.create!(recipe_id: 10, user_id: (2..user_count).to_a.sample, content: "This was the worst cookie recipe ever...They were so good i ate waaaayyy too many and got sick for 2 days...no joke. :) Great job.")
Comment.create!(recipe_id: 10, user_id: (2..user_count).to_a.sample, content: "After sitting hours upon hours in front of a computer searching for that one chocolate chip cookie recipe that would be 'the one', I finally found it.")
Comment.create!(recipe_id: 10, user_id: (2..user_count).to_a.sample, content: "These cookies are wonderful! They look just like they came from one of the cookie shops at the mall. I am impressed.")
Comment.create!(recipe_id: 10, user_id: (2..user_count).to_a.sample, content: "These cookies are delicious! They really are big and I dropped 1/8 cup of the cookie mix onto the cookie sheet instead of the whole 1/4 cup.")
Comment.create!(recipe_id: 10, user_id: (2..user_count).to_a.sample, content: "I made this exactly as the recipe is stated and the cookies came out very thin. They had an excellent flavor though. I am going to read the other reviews and try again.")


# http://allrecipes.com/recipe/10549/best-brownies/?internalSource=hub%20recipe&referringId=79&referringContentType=recipe%20hub&clickId=cardslot%2018
Recipe.create!(
  title: 'Best Brownies',
  description: 'These brownies always turn out!',
  ingredients: '1/2 cup butter#@!1 cup white sugar#@!2 eggs#@!1 teaspoon vanilla extract#@!1/3 cup unsweetened cocoa powder#@!1/2 cup all-purpose flour#@!1/4 teaspoon salt#@!1/4 teaspoon baking powder#@!3 tablespoons butter, softened#@!3 tablespoons unsweetened cocoa powder#@!1 tablespoon honey#@!1 teaspoon vanilla extract#@!1 cup confectioners\' sugar',
  user_id: (1..user_count).to_a.sample,
  category_id: 3,
  prep_time: 25,
  cook_time: 35,
  steps_attributes: [{
    body: '0Preheat oven to 350 degrees F (175 degrees C). Grease and flour an 8-inch square pan.',
    order:0
  }, {
    body: '0In a large saucepan, melt 1/2 cup butter. Remove from heat, and stir in sugar, eggs, and 1 teaspoon vanilla. Beat in 1/3 cup cocoa, 1/2 cup flour, salt, and baking powder. Spread batter into prepared pan.',
    order:1
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473109529/3900359_dtafzy.jpg',
    order:2
  }, {
    body: '0Bake in preheated oven for 25 to 30 minutes. Do not overcook.',
    order:3
  }, {
    body: '0To Make Frosting: Combine 3 tablespoons softened butter, 3 tablespoons cocoa, honey, 1 teaspoon vanilla extract, and 1 cup confectioners\' sugar. Stir until smooth. Frost brownies while they are still warm.',
    order:4
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473109528/1090243_qqcyjn.jpg',
    order:5
  }
  ]
)

Comment.create!(recipe_id: 11, user_id: (1..user_count).to_a.sample, content: "These brownies are magnificent!!! I mean \"melt in your mouth\" and I didn't even make the frosting. I doubled the recipe and it still won't be enough.")
Comment.create!(recipe_id: 11, user_id: (1..user_count).to_a.sample, content: "I doubled the recipe and made a 9x13 pan of these brownies for a party, and everybody loved them! I also entered them in my local county fair and won first place.")
Comment.create!(recipe_id: 11, user_id: (1..user_count).to_a.sample, content: "Wonderful little brownie! Not too thick, not too thin, just right! Comes together and into the oven in less than 5 minutes. I added about 1 additional T. of cocoa.")
Comment.create!(recipe_id: 11, user_id: (1..user_count).to_a.sample, content: "These were the BEST BROWNIES even without the frosting. Just don't OVERBAKE/OVERMIX. When doubling, leave out one egg, keep the amount of salt at 1/4 tsp, and bake for 30-35 mins.")
Comment.create!(recipe_id: 11, user_id: (1..user_count).to_a.sample, content: "Worth a try, very easy recipe yielding above average brownies. When the recipe says not to overcook, don't...depending on your oven 25 minutes is probably long enough.")
Comment.create!(recipe_id: 11, user_id: (1..user_count).to_a.sample, content: "MMmmmm is all I can say. I just took my first bite. They taste more like fudge than brownies. The frosting is the key.")
Comment.create!(recipe_id: 11, user_id: (1..user_count).to_a.sample, content: "This recipe needs another review like I need another brownie - but I just couldn't stop eating them.")
Comment.create!(recipe_id: 11, user_id: (1..user_count).to_a.sample, content: "I really enjoyed these brownies. I was a little leary because of the frosting. I think my husband likes them but every time he eats one he complains that they are \"too fudgey.\"")
Comment.create!(recipe_id: 11, user_id: (1..user_count).to_a.sample, content: "These are super. We don't bother with the frosting though, they don't need it. Many other reviewers say these are too cakey, that's not the fault of the recipe.")


# http://allrecipes.com/recipe/223016/fresh-blueberry-cake/?internalSource=staff%20pick&referringId=79&referringContentType=recipe%20hub&clickId=cardslot%208
Recipe.create!(
  title: 'Fresh Blueberry Cake',
  description: 'This is a DELICIOUS blueberry cake made with fresh blueberries! It is great with confectioners sugar or whipped cream on top!',
  ingredients: '2 cups all-purpose flour#@!2 teaspoons baking powder#@!1 cup white sugar#@!1/4 teaspoon salt#@!1/3 cup shortening#@!3/4 cup milk#@!1 egg#@!1 teaspoon lemon zest#@!1 cup blueberries',
  user_id: (1..user_count).to_a.sample,
  category_id: 3,
  prep_time: 15,
  cook_time: 50,
  steps_attributes: [{
    body: '0Preheat oven to 350 degrees F (175 degrees C). Grease an 8x8-inch pan.',
    order:0
  }, {
    body: '0Sift flour, baking powder, sugar, and salt together in a large bowl. Beat shortening in a separate bowl until creamy; stir into flour mixture, alternating with milk. Beat flour-shortening mixture until mixed, about 2 minutes. Add egg and beat until mixed, about 1 minute.',
    order:1
  }, {
    body: '0Combine lemon zest with blueberries in a bowl; fold into batter. Pour batter into prepared pan.',
    order:2
  }, {
    body: '0Bake in the preheated oven until a toothpick inserted in the center comes out clean, about 50 minutes.',
    order:3
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473109795/1274002_lvgraj.jpg',
    order:4
  }
  ]
)

Comment.create!(recipe_id: 12, user_id: (1..user_count).to_a.sample, content: "Very nice old fashion type recipe. I added a crumb topping to the top. I used fresh picked blueberries and ate it warm with whipped topping. Fairly moist cake which has lasted into the next day nicely. Def. recommend the 8x8 pan as in the directions.")
Comment.create!(recipe_id: 12, user_id: (1..user_count).to_a.sample, content: "I needed some breakfast cakes and used this recipe to accomplish that task. They were good tasting and made up quickly.")
Comment.create!(recipe_id: 12, user_id: (1..user_count).to_a.sample, content: "Very Yummy!")
Comment.create!(recipe_id: 12, user_id: (1..user_count).to_a.sample, content: "Very good cake that my family enjoyed. I love lemon so added the zest of the whole lemon. I also made a glaze using the juice of half a lemon mixed with 3 1/2 T.")
Comment.create!(recipe_id: 12, user_id: (1..user_count).to_a.sample, content: "My husband isn't a huge blueberry fan and loved this cake. I made it as written but added about a tsp. of vanilla out of habit.")
Comment.create!(recipe_id: 12, user_id: (1..user_count).to_a.sample, content: "This was great! it was easy to make also. I cut back slightly on the sugar but I think I would not the next time, the cake I made could have been sweeter.")
Comment.create!(recipe_id: 12, user_id: (1..user_count).to_a.sample, content: "best cake we ever had!!!!!!!!!")
Comment.create!(recipe_id: 12, user_id: (1..user_count).to_a.sample, content: "This is delicious....I did not have shortening in the house , so I used butter, too....also did not have fresh lemon, but used ground lemon peel with lemon oil...")
Comment.create!(recipe_id: 12, user_id: (1..user_count).to_a.sample, content: "This was a decent cake. My daughter really enjoyed it.")
Comment.create!(recipe_id: 12, user_id: (1..user_count).to_a.sample, content: "This cake is a bit dense. Very old fashioned cake. I didnt have lemon zest so i used some butter extract.")



# http://allrecipes.com/recipe/59661/spinach-enchiladas/?internalSource=hn_carousel%2001_Spinach%20Enchiladas&referringId=87&referringContentType=recipe%20hub&referringPosition=carousel%2001
Recipe.create!(
  title: 'Spinach Enchiladas',
  description: 'If you like spinach and Mexican food, you\'ll love these easy vegetarian enchiladas made with ricotta cheese and spinach.',
  ingredients: '1 tablespoon butter#@!1/2 cup sliced green onions#@!2 cloves garlic, minced#@!1 (10 ounce) package frozen chopped spinach, thawed, drained and squeezed dry#@!1 cup ricotta cheese#@!1/2 cup sour cream#@!2 cups shredded Monterey Jack cheese#@!10 (6 inch) corn tortillas#@!1 (19 ounce) can enchilada sauce',
  user_id: (1..user_count).to_a.sample,
  category_id: 4,
  prep_time: 20,
  cook_time: 20,
  steps_attributes: [{
    body: '0Preheat the oven to 375 degrees F (190 degrees C).',
    order:0
  }, {
    body: '0Melt butter in a saucepan over medium heat. Add garlic and onion; cook for a few minutes until fragrant, but not brown. Stir in spinach, and cook for about 5 more minutes. Remove from the heat, and mix in ricotta cheese, sour cream, and 1 cup of Monterey Jack cheese.',
    order:1
  }, {
    body: '0In a skillet over medium heat, warm tortillas one at a time until flexible, about 15 seconds. Spoon about 1/4 cup of the spinach mixture onto the center of each tortilla. Roll up, and place seam side down in a 9x13 inch baking dish. Pour enchilada sauce over the top, and sprinkle with the remaining cup of Monterey Jack.',
    order:2
  }, {
    body: '0Bake for 15 to 20 minutes in the preheated oven, until sauce is bubbling and cheese is lightly browned at the edges.',
    order:3
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473351782/spinach_rbml3q.jpg',
    order:4
  }
  ]
)

Comment.create!(recipe_id: 13, user_id: (1..user_count).to_a.sample, content: "I enjoyed this recipe, only changed a few things to make it a little healthier/lower fat. I used red onion in place of the green ones and sauteed them in olive oil instead of butter.")
Comment.create!(recipe_id: 13, user_id: (1..user_count).to_a.sample, content: "I am reviewing my revised recipe, because I had a feeling this would be bland if made as is.")
Comment.create!(recipe_id: 13, user_id: (1..user_count).to_a.sample, content: "I really liked these, but, like another reviewer, I added seasonings to the spinach / cheese filling, like onion powder, garlic salt, cumin, chili powder, red pepper flakes, and pepper.")
Comment.create!(recipe_id: 13, user_id: (1..user_count).to_a.sample, content: "I love the enchiladas de espinaca at the local mexican restaurant and tried to copy them at home. To add color and flavor use tomatoes, add them part way through cooking the garlic and onions.")
Comment.create!(recipe_id: 13, user_id: (1..user_count).to_a.sample, content: "Everyone I have made these for loves them except for two of my sons who don't like even the thought of eating spinach and I have served them to a lot of people.")
Comment.create!(recipe_id: 13, user_id: (1..user_count).to_a.sample, content: "I printed this recipe knowing it would be good. I decided to add a little more of a mexican touch to it. Try this and you'll love them too.")
Comment.create!(recipe_id: 13, user_id: (1..user_count).to_a.sample, content: "I thought these were just terrific. I did sub a medium sweet onion for the green and added some seasonings to the spinach/cheese mix like cumin, salt, chili powder and hot pepper flakes.")
Comment.create!(recipe_id: 13, user_id: (1..user_count).to_a.sample, content: "I gave this a 5 stars because the flavor was good actually, BUT too much spinach in each one. I would actually next time add 1/2 cup of ricotta cheese and 3/4 cup sour cream.")
Comment.create!(recipe_id: 13, user_id: (1..user_count).to_a.sample, content: "This is a wonderful spinach enchilada recipe.")



# http://allrecipes.com/recipe/49552/quinoa-and-black-beans/?internalSource=hub%20recipe&referringId=87&referringContentType=recipe%20hub&clickId=cardslot%2013
Recipe.create!(
  title: 'Quinoa and Black Beans',
  description: 'Very flavorful alternative to black beans and rice. Quinoa is a nutty grain from South America.',
  ingredients: '1 teaspoon vegetable oil#@!1 onion, chopped#@!3 cloves garlic, chopped#@!3/4 cup quinoa#@!1 1/2 cups vegetable broth#@!1 teaspoon ground cumin#@!1/4 teaspoon cayenne pepper#@!salt and ground black pepper to taste#@!1 cup frozen corn kernels#@!2 (15 ounce) cans black beans, rinsed and drained#@!1/2 cup chopped fresh cilantro',
  user_id: 1,
  category_id: 4,
  prep_time: 15,
  cook_time: 35,
  steps_attributes: [{
    body: '0Heat oil in a saucepan over medium heat; cook and stir onion and garlic until lightly browned, about 10 minutes.',
    order:0
  }, {
    body: '0Mix quinoa into onion mixture and cover with vegetable broth; season with cumin, cayenne pepper, salt, and pepper. Bring the mixture to a boil. Cover, reduce heat, and simmer until quinoa is tender and broth is absorbed, about 20 minutes.',
    order:1
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473110486/3891450_pvn7qg.jpg',
    order:2
  }, {
    body: '0Stir frozen corn into the saucepan, and continue to simmer until heated through, about 5 minutes; mix in the black beans and cilantro.',
    order:3
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473110486/357989_b6nd1i.jpg',
    order:4
  }
  ]
)

Comment.create!(recipe_id: 14, user_id: (2..user_count).to_a.sample, content: "If I could give this six stars, I would. This satisfies ALL my requirements for a \"great\" recipe! Get a load of this, and I am not exaggerating: it's quick and easy, inexpensive, attractive.")
Comment.create!(recipe_id: 14, user_id: (2..user_count).to_a.sample, content: "This recipe was great! I served it as a side dish, but it definitely has potential to be a main course.")
Comment.create!(recipe_id: 14, user_id: (2..user_count).to_a.sample, content: "This one gets five stars. We had never tried quinoa, so we weren't sure what to expect. I followed another reviewer's tip to rinse the quinoa well before cooking, and there was no bitter taste.")
Comment.create!(recipe_id: 14, user_id: (2..user_count).to_a.sample, content: "Really good. I followed the others advise and added to the recipe. I added zucchini and tomato as well as fresh lemon juice.")
Comment.create!(recipe_id: 14, user_id: (2..user_count).to_a.sample, content: "I'd never prepared nor eaten quinoa before (pronounced “keen-wa”; I didn't even know that!). ;) It is supposed to be very healthy & a complete protein, so I wanted to try it. ")
Comment.create!(recipe_id: 14, user_id: (2..user_count).to_a.sample, content: "I used bulgur wheat instead of quinoa (I'm a poor college student and the bulgur was MUCH cheaper!) but the recipe was still fantastic!!! The spices are just right!")
Comment.create!(recipe_id: 14, user_id: (2..user_count).to_a.sample, content: "The proportions and flavors are mostly good, and I changed the directions only slightly. Two cans of black beans seemed too much to me, so I stopped at one.")
Comment.create!(recipe_id: 14, user_id: (2..user_count).to_a.sample, content: "My husband loved this! I decided at the last minute to use only one can of black beans. I put the first one in, and it seemed like another one would be overkill.")
Comment.create!(recipe_id: 14, user_id: (2..user_count).to_a.sample, content: "Simple, healthy, adaptable, yay! This was a little bland for our tastes, so I'll be kicking up the spices a notch but I'll definitely make it again.")
Comment.create!(recipe_id: 14, user_id: (2..user_count).to_a.sample, content: "This is a great recipe. I have made it a few times already and I love it more and more each time. (I usually only use 1 can of beans.)")



# http://allrecipes.com/recipe/85452/homemade-black-bean-veggie-burgers/?internalSource=hub%20recipe&referringId=87&referringContentType=recipe%20hub&clickId=cardslot%2024
Recipe.create!(
  title: 'Homemade Black Bean Veggie Burgers',
  description: 'You will never want to eat frozen veggie burgers again. These are so easy, and you\'ll be proud to have created such a vegetarian delight.',
  ingredients: '1 (16 ounce) can black beans, drained and rinsed#@!1/2 green bell pepper, cut into 2 inch pieces#@!1/2 onion, cut into wedges#@!3 cloves garlic, peeled#@!1 egg#@!1 tablespoon chili powder#@!1 tablespoon cumin#@!1 teaspoon Thai chili sauce or hot sauce#@!1/2 cup bread crumbs',
  user_id: (1..user_count).to_a.sample,
  category_id: 4,
  prep_time: 15,
  cook_time: 20,
  steps_attributes: [{
    body: '0If grilling, preheat an outdoor grill for high heat, and lightly oil a sheet of aluminum foil. If baking, preheat oven to 375 degrees F (190 degrees C), and lightly oil a baking sheet.',
    order:0
  }, {
    body: '0In a medium bowl, mash black beans with a fork until thick and pasty.',
    order:1
  }, {
    body: '0In a food processor, finely chop bell pepper, onion, and garlic. Then stir into mashed beans.',
    order:2
  }, {
    body: '0In a small bowl, stir together egg, chili powder, cumin, and chili sauce.',
    order:3
  }, {
    body: '0Stir the egg mixture into the mashed beans. Mix in bread crumbs until the mixture is sticky and holds together. Divide mixture into four patties.',
    order:4
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473111066/3793505_eu0fgo.jpg',
    order:5
  }, {
    body: '0If grilling, place patties on foil, and grill about 8 minutes on each side. If baking, place patties on baking sheet, and bake about 10 minutes on each side.',
    order:6
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473111066/820428_gp3agh.jpg',
    order:7
  }
  ]
)

Comment.create!(recipe_id: 15, user_id: (1..user_count).to_a.sample, content: "I love these burgers. Let me tell you how to keep them from falling apart, though. First, you must rinse the black beans and dry them off before mashing them.")
Comment.create!(recipe_id: 15, user_id: (1..user_count).to_a.sample, content: "Delicious and easy! I substituted red bell pepper for green and used rolled oats instead of bread crumbs. I reduced cumin to 1 tsp and used 2 eggs.")
Comment.create!(recipe_id: 15, user_id: (1..user_count).to_a.sample, content: "One of the best dishes I made this month! You can substitute or add corn kernels to the burgers for more texture and flavor, but not necessary! ")
Comment.create!(recipe_id: 15, user_id: (1..user_count).to_a.sample, content: "If you love black beans, you'll love this recipe. My recommendation however, is to use whole-wheat Ritz crackers, instead of breadcrumbs. They add much more flavor.")
Comment.create!(recipe_id: 15, user_id: (1..user_count).to_a.sample, content: "Okay, these are awesome. I hate the price of the supermarket veggie burgers and these are even better! I made the recipe exactly as directed and it was perfect.")
Comment.create!(recipe_id: 15, user_id: (1..user_count).to_a.sample, content: "Great recipe! Two eggs is the way to go, no falling apart and not dry. I used all ingredients but also used corn.")
Comment.create!(recipe_id: 15, user_id: (1..user_count).to_a.sample, content: "Mmmmm-so good we decided to freeze the rest of the batch for an easy, reheat meal during the week.")
Comment.create!(recipe_id: 15, user_id: (1..user_count).to_a.sample, content: "Fun to make! I have already made it twice in the past 3 weeks. I use eggbeaters instead of real eggs, and 1-1.5 eggs (1/4-3/8 cups) seems to form the perfect consistency.")
Comment.create!(recipe_id: 15, user_id: (1..user_count).to_a.sample, content: "The first time I made these seemed like a disaster. The mix was runny and could not be formed into anything, it was almost like soup.")
Comment.create!(recipe_id: 15, user_id: (1..user_count).to_a.sample, content: "This is DELICIOUS. I swear, it is wayyyy better than storebought! I don't have a grill, so I did things a bit differently than some of the other reviewers.")
Comment.create!(recipe_id: 15, user_id: (1..user_count).to_a.sample, content: "hese burgers are delicious! As others have said, you need to squeeze the excess water out of the pepper and onion mixture before adding it to the beans.")


# http://allrecipes.com/recipe/13113/rich-and-creamy-tomato-basil-soup/?internalSource=recipe%20hub&referringId=87&referringContentType=recipe%20hub&clickId=cardslot%2049
Recipe.create!(
  title: 'Rich and Creamy Tomato Basil Soup',
  description: 'The secret to the richness of this soup is to use real butter, fresh basil leaves, and heavy cream. Please do not substitute, or you will not have the same high quality end result.',
  ingredients: '4 tomatoes - peeled, seeded and diced#@!4 cups tomato juice#@!14 leaves fresh basil#@!1 cup heavy whipping cream#@!1/2 cup butter#@!salt and pepper to taste',
  user_id: (1..user_count).to_a.sample,
  category_id: 4,
  prep_time: 10,
  cook_time: 35,
  steps_attributes: [{
    body: '0Place tomatoes and juice in a stock pot over medium heat. Simmer for 30 minutes. Puree the tomato mixture along with the basil leaves, and return the puree to the stock pot.',
    order:0
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473116585/3790757_dduzm9.jpg',
    order:1
  }, {
    body: '0Place the pot over medium heat, and stir in the heavy cream and butter. Season with salt and pepper. Heat, stirring until the butter is melted. Do not boil.',
    order:2
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473116585/114717_gttdmc.jpg',
    order:3
  }
  ]
)

Comment.create!(recipe_id: 16, user_id: (1..user_count).to_a.sample, content: "Follow my train of thought here: When you go to a nice restaurant and the waiter describes the \"soup of the day,\" it's this stuff that he is talking about.")
Comment.create!(recipe_id: 16, user_id: (1..user_count).to_a.sample, content: "This recipe was excellent!! A restaurant near my house makes the best Tomato Basil soup, so I was looking for a recipe to imitate theirs.")
Comment.create!(recipe_id: 16, user_id: (1..user_count).to_a.sample, content: "I loved this soup!!! I did not peel the tomatoes, just seeded them. I cut the cream in half as suggested by others & only used about 1/3 of a cup of butter.")
Comment.create!(recipe_id: 16, user_id: (1..user_count).to_a.sample, content: "The longer you let the tomatoes and juice simmer before adding the cream, the more intense flavor you will have. The first time I made this I used fresh roma tomatoes.")
Comment.create!(recipe_id: 16, user_id: (1..user_count).to_a.sample, content: "This was absolutely fabulous and my husband's new favorite! Used fresh tomatoes which makes all the difference.... added salt, pepper and garlic pepper at the end to season. Divine!")
Comment.create!(recipe_id: 16, user_id: (1..user_count).to_a.sample, content: "This soup is going to taste a little sharp when you add TINNED tomatoes. The sharpness probably came from the metal of the can. ")
Comment.create!(recipe_id: 16, user_id: (1..user_count).to_a.sample, content: "So good I nearly passed out! My husband and I had a tomato-basil soup at a restaurant here in San Antonio and I've been looking for a recipe to duplicate it...this is it!")
Comment.create!(recipe_id: 16, user_id: (1..user_count).to_a.sample, content: "I've always wanted a recipe for La Madeleine's soup, and this is maybe even better (since I can tweak it to personal preference too)!")
Comment.create!(recipe_id: 16, user_id: (1..user_count).to_a.sample, content: "Yummm....I have paid $9 for a jar of creamy tomato basil soup from a popular French restaurant chain here in Houston--because it was sooo good!")
Comment.create!(recipe_id: 16, user_id: (1..user_count).to_a.sample, content: "It really bothers me when people rate a recipe after totally changing it. This makes perfect tomato soup exactly as written. Thanks so much for sharing it!")


# http://allrecipes.com/recipe/78370/hamburger-steak-with-onions-and-gravy/?internalSource=staff%20pick&referringId=92&referringContentType=recipe%20hub&clickId=cardslot%202
Recipe.create!(
  title: 'Hamburger Steak with Onions and Gravy',
  description: 'An easy-to-make classic featuring tasty hamburger \'steaks\' smothered in gravy and onions. Traditionally served with hot white rice or potatoes, it\'s a great way to dress up a pound of ground beef and you probably have all the ingredients on hand!',
  ingredients: '1 pound ground beef#@!1 egg#@!1/4 cup bread crumbs#@!1/8 teaspoon ground black pepper#@!1/2 teaspoon seasoned salt#@!1/2 teaspoon onion powder#@!1/2 teaspoon garlic powder#@!1 teaspoon Worcestershire sauce#@!1 tablespoon vegetable oil#@!1 cup thinly sliced onion#@!2 tablespoons all-purpose flour#@!1 cup beef broth#@!1 tablespoon cooking sherry#@!1/2 teaspoon seasoned salt',
  user_id: (1..user_count).to_a.sample,
  category_id: 5,
  prep_time: 15,
  cook_time: 25,
  steps_attributes: [{
    body: '0In a large bowl, mix together the ground beef, egg, bread crumbs, pepper, salt, onion powder, garlic powder, and Worcestershire sauce. Form into 8 balls, and flatten into patties.',
    order:0
  }, {
    body: '0Heat the oil in a large skillet over medium heat. Fry the patties and onion in the oil until patties are nicely browned, about 4 minutes per side. Remove the beef patties to a plate, and keep warm.',
    order:1
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473118331/2147978_zaytte.jpg',
    order:2
  }, {
    body: '0Sprinkle flour over the onions and drippings in the skillet. Stir in flour with a fork, scraping bits of beef off of the bottom as you stir. Gradually mix in the beef broth and sherry. Season with seasoned salt. Simmer and stir over medium-low heat for about 5 minutes, until the gravy thickens. Turn heat to low, return patties to the gravy, cover, and simmer for another 15 minutes.',
    order:3
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473118331/2981163_g0o5rp.jpg',
    order:4
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473351783/steak_amqcsx.jpg',
    order:5
  }
  ]
)

Comment.create!(recipe_id: 17, user_id: (1..user_count).to_a.sample, content: "Very good burger! I would like to mention that I am very surprised at some of the reviews, since that change so many ingredients. Raven left out five items and still gave it five stars.")
Comment.create!(recipe_id: 17, user_id: (1..user_count).to_a.sample, content: "These were really good. I made six small patties out of this. I didn't use sherry, but thought that the taste was stil excellent.")
Comment.create!(recipe_id: 17, user_id: (1..user_count).to_a.sample, content: "I'm always so nervous trying dishes without reviews! But I just thought this sounded good. And it IS good, so that was a relief.")
Comment.create!(recipe_id: 17, user_id: (1..user_count).to_a.sample, content: "After we travel, Hubs and I crave an old-fashioned, comfort food dinner. I was on a plane at 37,000 ft. when I came across this recipe and couldn’t wait to get home to make it.")
Comment.create!(recipe_id: 17, user_id: (1..user_count).to_a.sample, content: "We loved this recipe, thanks! I used French Onion soup instead of the beef broth, and would highly recommend using ground Angus for the beef. The flavor is wonderful, thanks!")
Comment.create!(recipe_id: 17, user_id: (1..user_count).to_a.sample, content: "This doesn't apply to this recipe specifically, but I am sick and tired of reading bad reviews from people who haven't even tried the recipe.")
Comment.create!(recipe_id: 17, user_id: (1..user_count).to_a.sample, content: "this recipe is excellent as is. Please, people....review the recipe as it is, and rate it as it is!!")
Comment.create!(recipe_id: 17, user_id: (1..user_count).to_a.sample, content: "Good recipe, but using fresh herbs and spices really helps...fresh grated garlic, minced onions or grated onion, fresh cracked pepper etc. really makes a big difference...")
Comment.create!(recipe_id: 17, user_id: (1..user_count).to_a.sample, content: "This was VERY yummy!!! As always, I made the recipe EXACTLY as it is and I have to say I owuldn't change a thing.")
Comment.create!(recipe_id: 17, user_id: (1..user_count).to_a.sample, content: "We just loved this! I did double the gravy and used a can of onion soup, mmmm mmmm good! I used rice but next time I make this I will make it with mashed potatoes, this is the best gravy! hum!")


# http://allrecipes.com/recipe/8948/italian-chicken-marinade/?internalSource=staff%20pick&referringId=88&referringContentType=recipe%20hub&clickId=cardslot%203
Recipe.create!(
  title: 'Italian Chicken Marinade',
  description: 'This is a simple but delicious way of marinating your chicken.',
  ingredients: '1 (16 ounce) bottle Italian-style salad dressing#@!1 teaspoon garlic powder#@!1 teaspoon salt#@!4 skinless, boneless chicken breast halves',
  user_id: 1,
  category_id: 5,
  prep_time: 15,
  cook_time: 15,
  steps_attributes: [{
    body: '0In a shallow baking dish, mix the salad dressing, garlic powder, and salt. Place the chicken in the bowl, and turn to coat. Marinate in the refrigerator at least 4 hours. (For best results, marinate overnight.)',
    order:0
  }, {
    body: '0Preheat the grill for high heat.',
    order:1
  }, {
    body: '0Lightly oil grate. Discard marinade, and grill chicken 8 minutes on each side, or until juices run clear.',
    order:2
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473118759/665982_zxxofp.jpg',
    order:3
  }
  ]
)

Comment.create!(recipe_id: 18, user_id: (2..user_count).to_a.sample, content: "A good easy recipe when you are short on prep time. BUT, I think a whole bottle of dressing is too much. 8 oz or 1/2 would be plenty for 4 chicken breasts.")
Comment.create!(recipe_id: 18, user_id: (2..user_count).to_a.sample, content: "I sometimes will cook my chicken in a non stick skillet using Italian Dressing only as my cooking oil. Usually when the weather isn't good enough outside to cook on the grill.")
Comment.create!(recipe_id: 18, user_id: (2..user_count).to_a.sample, content: "I have been using something like this for years as well. I leave out the salt and add hot sauce (like RedHot).")
Comment.create!(recipe_id: 18, user_id: (2..user_count).to_a.sample, content: "I don't know what magic occurs when these 4 little ingredients come together, but the results are fantastic. ")
Comment.create!(recipe_id: 18, user_id: (2..user_count).to_a.sample, content: "I used this marinade on 3 lbs. of chicken parts instead of the boneless breasts. I marinated the chicken about 8 hrs., then baked it at 400 for almost an hour.")
Comment.create!(recipe_id: 18, user_id: (2..user_count).to_a.sample, content: "Delicious and Super Easy - I agree with the other reviewers - you don't need a whole bottle of dressing!!")
Comment.create!(recipe_id: 18, user_id: (2..user_count).to_a.sample, content: "If possible I would give this an extra 5 stars! I definitely will use this recipe over and over. The chicken was MARVELOUS!")
Comment.create!(recipe_id: 18, user_id: (2..user_count).to_a.sample, content: "5 stars for a quick and easy marinade. I thawed the chicken out first, then poked holes in it so that the marinade would soak in! This was a great summer dinner!! Thanks")
Comment.create!(recipe_id: 18, user_id: (2..user_count).to_a.sample, content: "I marinated my chicken in this sauce the night before a big cookout. The flavor was so good. I recommend it for the grill or the oven. Great!!!")
Comment.create!(recipe_id: 18, user_id: (2..user_count).to_a.sample, content: "SO simple and good! I used my own Italian dressing with balsamic vinegar and served it to guests. They loved it.")



# http://allrecipes.com/recipe/54342/chipotle-crusted-pork-tenderloin/?internalSource=staff%20pick&referringId=88&referringContentType=recipe%20hub&clickId=cardslot%206
Recipe.create!(
  title: 'Chipotle Crusted Pork Tenderloin',
  description: 'Sweet and spicy rub for pork tenderloins. Just coat, let stand for 20 minutes and grill! Goes great with polenta or mashed yams.',
  ingredients: '1 teaspoon onion powder#@!1 teaspoon garlic powder#@!3 tablespoons chipotle chile powder#@!1 1/2 teaspoons salt#@!4 tablespoons brown sugar#@!2 (3/4 pound) pork tenderloins',
  user_id: (1..user_count).to_a.sample,
  category_id: 5,
  prep_time: 15,
  cook_time: 20,
  steps_attributes: [{
    body: '0Preheat grill for medium-high heat.',
    order:0
  }, {
    body: '0In a large resealable plastic bag, combine the onion powder, garlic powder, chipotle chile powder, salt, and brown sugar. Place tenderloins in bag and shake, coating meat evenly. Refrigerate for 10 to 15 minutes.',
    order:1
  }, {
    body: '0Lightly oil grill grate, and arrange meat on grate. Cook for 20 minutes, turning meat every 5 minutes. Remove from grill, let stand for 5 to 10 minutes before slicing.',
    order:2
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473118993/2307838_wom9gl.jpg',
    order:3
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473118993/1024082_gsgvbq.jpg',
    order:4
  }
  ]
)

Comment.create!(recipe_id: 19, user_id: (1..user_count).to_a.sample, content: "My boyfriend and I have made this twice and will be making it again and again!")
Comment.create!(recipe_id: 19, user_id: (1..user_count).to_a.sample, content: "Outstanding recipe! Have made this a couple of times trying to find the right mix for my family. The first time I made it, I loved it and the husband couldn't eat it.")
Comment.create!(recipe_id: 19, user_id: (1..user_count).to_a.sample, content: "Great as long as you like spicy. Cooked indoors with oven. I found the chipolte spice at Linens N Things.")
Comment.create!(recipe_id: 19, user_id: (1..user_count).to_a.sample, content: "This is a 10+. It's freakin awesome! I never grill (3 times in 10 years), but I wanted to try something new.")
Comment.create!(recipe_id: 19, user_id: (1..user_count).to_a.sample, content: "Tried this last night and it was excellent! I couldn't find the chipotle chile powder so used regular chili powder and cut back to 1 tbsp. Great flavors - will definitley make this again!")
Comment.create!(recipe_id: 19, user_id: (1..user_count).to_a.sample, content: "I am Cajun and love spicy foods. My husband doesn't love spicy as much as me. So I cut the chipotle to 2T, thinking that would be fine. I almost killed my poor husband!")
Comment.create!(recipe_id: 19, user_id: (1..user_count).to_a.sample, content: "We had a 3# tenderloin that needed to be used tonight. Decided on this recipe because we LOVE using chipotle peppers/seasoning in our cooking.")
Comment.create!(recipe_id: 19, user_id: (1..user_count).to_a.sample, content: "I followed the recipe as written except I didn't have onion powder, so I used half an onion diced. I also marinated the pork in the spices for about 2 hours.")
Comment.create!(recipe_id: 19, user_id: (1..user_count).to_a.sample, content: "awesome! I used only 1 tablespoon of the chipotle and it was plenty spicy. Our favorite is to slice super thin and use in burritos.")


# http://allrecipes.com/recipe/143809/best-steak-marinade-in-existence/?internalSource=hub%20recipe&referringId=88&referringContentType=recipe%20hub&clickId=cardslot%2018
Recipe.create!(
  title: 'Best Steak Marinade in Existence',
  description: 'This is a family recipe that has been developed only over the last 5 years. In this short time it\'s made me famous in our close circle, but until now I\'ve never shared it with anyone.',
  ingredients: '1/3 cup soy sauce#@!1/2 cup olive oil#@!1/3 cup fresh lemon juice#@!1/4 cup Worcestershire sauce#@!1 1/2 tablespoons garlic powder#@!3 tablespoons dried basil#@!1 1/2 tablespoons dried parsley flakes#@!1 teaspoon ground white pepper#@!1/4 teaspoon hot pepper sauce (optional)#@!1 teaspoon dried minced garlic (optional)',
  user_id: (1..user_count).to_a.sample,
  category_id: 5,
  prep_time: 15,
  cook_time: 15,
  steps_attributes: [{
    body: '0Place the soy sauce, olive oil, lemon juice, Worcestershire sauce, garlic powder, basil, parsley, and pepper in a blender. Add hot pepper sauce and garlic, if desired. Blend on high speed for 30 seconds until thoroughly mixed.',
    order:0
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473119257/3813344_dqmzk8.jpg',
    order:1
  }, {
    body: '0Pour marinade over desired type of meat. Cover, and refrigerate for up to 8 hours. Cook meat as desired.',
    order:2
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473119257/1398925_snmhhg.jpg',
    order:3
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473119257/3804197_zxojvj.jpg',
    order:4
  }
  ]
)

Comment.create!(recipe_id: 20, user_id: (1..user_count).to_a.sample, content: "Pretty tasty stuff. I didn't blend this and really can't see why you'd have to. Just throw it into a ziploc bag and mix is up. I cut the marinade in half because I had just two steaks.")
Comment.create!(recipe_id: 20, user_id: (1..user_count).to_a.sample, content: "This marinade was amazing. I really wasn't sure about the ingredients (didn't want teriyaki type), and decided to take a chance based upon the ratings. Boy, was I glad I did.")
Comment.create!(recipe_id: 20, user_id: (1..user_count).to_a.sample, content: "The best marinade that I have ever used. I was very skeptical, aspecially after I blended it. It did not look like it would taste good but it was really really good. I used top sirloin.")
Comment.create!(recipe_id: 20, user_id: (1..user_count).to_a.sample, content: "I don't know if this is \"THE BEST\" steak marinade, but it comes in close. I used this on two pretty large NY stips and it came out great!")
Comment.create!(recipe_id: 20, user_id: (1..user_count).to_a.sample, content: "Very good marinade. I only had garlic salt, and it was a mistake to use it. The garlic salt made the marinade too salty, definitely make sure you use garlic powder as the resipe calls for! ")
Comment.create!(recipe_id: 20, user_id: (1..user_count).to_a.sample, content: "This recipe is Awesome. My husband LOVED it. I didn't have any Lemon Juice so I used Lime and it came out Great.")
Comment.create!(recipe_id: 20, user_id: (1..user_count).to_a.sample, content: "Excellent Marinade. I actually didn't add the last 4 ingredients. I didn't have parsley flakes & just forgot the pepper.")
Comment.create!(recipe_id: 20, user_id: (1..user_count).to_a.sample, content: "This marinade was really flavorful. I marinated the steaks overnight and the meat was juicy & tender. Great recipe!")
Comment.create!(recipe_id: 20, user_id: (1..user_count).to_a.sample, content: "Used fresh garlic instead of powder. Great flavor!")
Comment.create!(recipe_id: 20, user_id: (1..user_count).to_a.sample, content: "This marinade was simply wonderful. We have been cutting back on expesnses in our home, which includes not eating out.")


# http://allrecipes.com/recipe/51283/maple-salmon/?internalSource=hn_carousel%2002_Maple%20Salmon&referringId=93&referringContentType=recipe%20hub&referringPosition=carousel%2002
Recipe.create!(
  title: 'Maple Salmon',
  description: 'This is the best and most delicious salmon recipe, and very easy to prepare. I love maple in everything and put this together one night. My husband totally loved it; he did not like salmon that much until he had this.',
  ingredients: '1/4 cup maple syrup#@!2 tablespoons soy sauce#@!1 clove garlic, minced#@!1/4 teaspoon garlic salt#@!1/8 teaspoon ground black pepper#@!1 pound salmon',
  user_id: (1..user_count).to_a.sample,
  category_id: 6,
  prep_time: 10,
  cook_time: 20,
  steps_attributes: [{
    body: '0In a small bowl, mix the maple syrup, soy sauce, garlic, garlic salt, and pepper.',
    order:0
  }, {
    body: '0Place salmon in a shallow glass baking dish, and coat with the maple syrup mixture. Cover the dish, and marinate salmon in the refrigerator 30 minutes, turning once.',
    order:1
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473119794/1995524_zpzlm5.jpg',
    order:3
  }, {
    body: '0Preheat oven to 400 degrees F (200 degrees C).',
    order:2
  }, {
    body: '0Place the baking dish in the preheated oven, and bake salmon uncovered 20 minutes, or until easily flaked with a fork.',
    order:4
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473351781/salmon_lmyt8o.jpg',
    order:5
  }
  ]
)

Comment.create!(recipe_id: 21, user_id: (1..user_count).to_a.sample, content: "Hi - this is Starflower and I submitted this recipe. Just wanted to let you know...you never marinate fish for more than 30 minutes! It is not like meat. Per professional chefs.")
Comment.create!(recipe_id: 21, user_id: (1..user_count).to_a.sample, content: "The recipe was pretty good as is. I would specify that cooking salmon is not as simple as placing in oven for x amount of time. You should cook salmon based on thickness.")
Comment.create!(recipe_id: 21, user_id: (1..user_count).to_a.sample, content: "oh my!!! this has got to be one of the yummiest things i've cooked lately! i used organic DARK maple syrup.. ")
Comment.create!(recipe_id: 21, user_id: (1..user_count).to_a.sample, content: "One of my favorites with this small variation. I bake in foil for 15 minutes and then break open the foil under the broiler for the last 4-5 minutes.")
Comment.create!(recipe_id: 21, user_id: (1..user_count).to_a.sample, content: "I have made this once. My family REALLY liked it, especially me because it was easy.")
Comment.create!(recipe_id: 21, user_id: (1..user_count).to_a.sample, content: "This is a great recipe with one change. Add fresh ginger... I use about a tablespoon, or a little more/less to taste. I also don't add garlic salt.")
Comment.create!(recipe_id: 21, user_id: (1..user_count).to_a.sample, content: "Even though my husband doesn't often enjoy \"sweet\" meat, he likes this one. I purchased frozen salmon and made up the marinade as the salmon was thawing.")
Comment.create!(recipe_id: 21, user_id: (1..user_count).to_a.sample, content: "I make this recipe exactly as is and I absolutely love it. If I lived on a farm and this recipe was a pig I'd want to keep it as a pet and give it only the finest table scraps.")



# http://allrecipes.com/recipe/17753/coconut-shrimp-i/?internalSource=staff%20pick&referringId=93&referringContentType=recipe%20hub&clickId=cardslot%208
Recipe.create!(
  title: 'Coconut Shrimp',
  description: 'These crispy shrimp are rolled in a coconut beer batter before frying. For dipping sauce, I use orange marmalade, mustard and horseradish mixed to taste.',
  ingredients: '1 egg#@!1/2 cup all-purpose flour#@!2/3 cup beer#@!1 1/2 teaspoons baking powder#@!1/4 cup all-purpose flour#@!2 cups flaked coconut#@!24 shrimp#@!3 cups oil for frying',
  user_id: (1..user_count).to_a.sample,
  category_id: 6,
  prep_time: 10,
  cook_time: 20,
  steps_attributes: [{
    body: '0In medium bowl, combine egg, 1/2 cup flour, beer and baking powder. Place 1/4 cup flour and coconut in two separate bowls.',
    order:0
  }, {
    body: '0Hold shrimp by tail, and dredge in flour, shaking off excess flour. Dip in egg/beer batter; allow excess to drip off. Roll shrimp in coconut, and place on a baking sheet lined with wax paper. Refrigerate for 30 minutes. Meanwhile, heat oil to 350 degrees F (175 degrees C) in a deep-fryer.',
    order:1
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473120096/3904707_kaiyof.jpg',
    order:2
  }, {
    body: '0Fry shrimp in batches: cook, turning once, for 2 to 3 minutes, or until golden brown. Using tongs, remove shrimp to paper towels to drain. Serve warm with your favorite dipping sauce.',
    order:3
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473120096/693130_sa7jww.jpg',
    order:4
  }
  ]
)

Comment.create!(recipe_id: 22, user_id: (1..user_count).to_a.sample, content: "Very delicious! I chilled the batter and marmalade overnight and prepared the shrimp the next day. Even though I lost coconut in the oil, a lot was still on the shrimp.")
Comment.create!(recipe_id: 22, user_id: (1..user_count).to_a.sample, content: "GREAT! However, I did pulse the coconut lightly in a food processor (previously mentioned) and it did adhere to the battered shrimp better (good tip).")
Comment.create!(recipe_id: 22, user_id: (1..user_count).to_a.sample, content: "I thought this recipe was good, but I made one change, instead of beer, I used coconut milk and it made it so coconutty. Yummy!")
Comment.create!(recipe_id: 22, user_id: (1..user_count).to_a.sample, content: "OMG OMG OMG These are SOO good. I cannot believe how well they turned out for me. I do not have a deep fryer, I just used a frying pan.")
Comment.create!(recipe_id: 22, user_id: (1..user_count).to_a.sample, content: "absolutely the best! far better than Red Lobster and Sam's frozen version, even better than the ultimate Outback Steakhouse. used another reviewer's recipe for sauce...together, can't be beat.")
Comment.create!(recipe_id: 22, user_id: (1..user_count).to_a.sample, content: "I printed off this recipe months ago but have been leary trying it because my boyfriend is not fond of coconut.")
Comment.create!(recipe_id: 22, user_id: (1..user_count).to_a.sample, content: "We had our daughter Tylers' birthday party this past weekend and she made these as part of our appetizers. The batter seemed a little thin, so I added more flour to get the right consistency.")



# http://allrecipes.com/recipe/13041/my-best-clam-chowder/?internalSource=hub%20recipe&referringId=93&referringContentType=recipe%20hub&clickId=cardslot%2027
Recipe.create!(
  title: 'My Best Clam Chowder',
  description: 'A delicious, traditional, cream based chowder, this recipe calls for the standard chowder ingredients: onion, celery, potatoes, diced carrots, clams, and cream. A little red wine vinegar is added before serving for extra flavor.',
  ingredients: '3 (6.5 ounce) cans minced clams#@!1 cup minced onion#@!1 cup diced celery#@!2 cups cubed potatoes#@!1 cup diced carrots#@!3/4 cup butter#@!3/4 cup all-purpose flour#@!1 quart half-and-half cream#@!2 tablespoons red wine vinegar#@!1 1/2 teaspoons salt#@!ground black pepper to taste',
  user_id: (1..user_count).to_a.sample,
  category_id: 6,
  prep_time: 25,
  cook_time: 25,
  steps_attributes: [{
    body: '0Drain juice from clams into a large skillet over the onions, celery, potatoes and carrots. Add water to cover, and cook over medium heat until tender.',
    order:0
  }, {
    body: '0Meanwhile, in a large, heavy saucepan, melt the butter over medium heat. Whisk in flour until smooth. Whisk in cream and stir constantly until thick and smooth. Stir in vegetables and clam juice. Heat through, but do not boil.',
    order:1
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473120739/2265674_j5rgzl.jpg',
    order:2
  }, {
    body: '0Stir in clams just before serving. If they cook too much they get tough. When clams are heated through, stir in vinegar, and season with salt and pepper.',
    order:3
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473120739/1024105_zoybz9.jpg',
    order:4
  }
  ]
)

Comment.create!(recipe_id: 23, user_id: (1..user_count).to_a.sample, content: "This was awesome. One modification, as per some earlier readers' comments: Before doing anything, I browned six strips of bacon in the large skillet, removed them and let them drain.")
Comment.create!(recipe_id: 23, user_id: (1..user_count).to_a.sample, content: "I have been a clam chowder fan for as long as I can remember. I order clam chowder often - when it's available. ")
Comment.create!(recipe_id: 23, user_id: (1..user_count).to_a.sample, content: "Very good recipe and is now a keeper in my personal recipes. I left out the celery and carrots due to veggie pickiness in the family and was concerned that would affect the overall flavor.")
Comment.create!(recipe_id: 23, user_id: (1..user_count).to_a.sample, content: "My husband and I are both loved this clam chowder. I changed it alittle by cooking the onions in drippings from 4 slices of bacon and reducing the amount of butter.")
Comment.create!(recipe_id: 23, user_id: (1..user_count).to_a.sample, content: "Delicious!! I make this recipe twice a month. Following other reviews, I use cornstarch instead of flour. I heat the cream (fat free) over low heat, while the vegetables are simmering.")
Comment.create!(recipe_id: 23, user_id: (1..user_count).to_a.sample, content: "This is a good clam chowder recipe. However, when I first made this I felt that the half and half made it too thick like a stew. Since then I have used milk and it's much better.")
Comment.create!(recipe_id: 23, user_id: (1..user_count).to_a.sample, content: "We lapped this stuff up! I was dubious first because there was a lot of vegetables and juice in the first mixture, but it all mixed together wonderfully!")



# http://allrecipes.com/recipe/21694/marinated-grilled-shrimp/?internalSource=hub%20recipe&referringId=93&referringContentType=recipe%20hub&clickId=cardslot%2015
Recipe.create!(
  title: 'Marinated Grilled Shrimp',
  description: 'A very simple and easy marinade that makes your shrimp so yummy you don\'t even need cocktail sauce! Don\'t let the cayenne pepper scare you, you don\'t even taste it. My 2 and 4 year-olds love it and eat more shrimp than their parents! It is also a big hit with company, and easy to prepare. I make this with frozen or fresh shrimp and use my indoor electric grill if the weather is not good for outside grilling. Try it with a salad, baked potato, and garlic bread. You will not be disappointed!!!',
  ingredients: '3 cloves garlic, minced#@!1/3 cup olive oil#@!1/4 cup tomato sauce#@!2 tablespoons red wine vinegar#@!2 tablespoons chopped fresh basil#@!1/2 teaspoon salt#@!1/4 teaspoon cayenne pepper#@!2 pounds fresh shrimp, peeled and deveined#@!skewers',
  user_id: (1..user_count).to_a.sample,
  category_id: 6,
  prep_time: 15,
  cook_time: 6,
  steps_attributes: [{
    body: '0In a large bowl, stir together the garlic, olive oil, tomato sauce, and red wine vinegar. Season with basil, salt, and cayenne pepper. Add shrimp to the bowl, and stir until evenly coated. Cover, and refrigerate for 30 minutes to 1 hour, stirring once or twice.',
    order:0
  }, {
    body: '0Preheat grill for medium heat. Thread shrimp onto skewers, piercing once near the tail and once near the head. Discard marinade.',
    order:1
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473120477/3740210_bxpynx.jpg',
    order:2
  }, {
    body: '0Lightly oil grill grate. Cook shrimp on preheated grill for 2 to 3 minutes per side, or until opaque.',
    order:3
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473120358/2374052_kycyfk.jpg',
    order:4
  }
  ]
)

Comment.create!(recipe_id: 24, user_id: (1..user_count).to_a.sample, content: "These were very nice. I was expecting outstanding flavour for five stars though and this just didn't make it.")
Comment.create!(recipe_id: 24, user_id: (1..user_count).to_a.sample, content: "For a small Oscar Party I made an arrangement of skewer recipes. My friend Kristi ABSOLUTELY loved this one.")
Comment.create!(recipe_id: 24, user_id: (1..user_count).to_a.sample, content: "This is a super simple and yummy recipe. The only thing I did differntly is used ketchup instead of tomato sauce, as I didn't want to open a large can of tamato sauce for such a little amount.")
Comment.create!(recipe_id: 24, user_id: (1..user_count).to_a.sample, content: "This recipe is AWESOME!!! Made these for a 4th of July party and they literally flew off the table.")
Comment.create!(recipe_id: 24, user_id: (1..user_count).to_a.sample, content: "I marinated 1 lb. of shrimp (the frozen, peeled and deveined kind) in a full batch of the marinade (enough for 2 people).")
Comment.create!(recipe_id: 24, user_id: (1..user_count).to_a.sample, content: "Just perfect and delicious as written, though I didn't bother with skewers since I only made enough shrimp for hubby and myself.")
Comment.create!(recipe_id: 24, user_id: (1..user_count).to_a.sample, content: "OMG, this is hands-down the best shrimp i have ever tasted in my whole entire life. this marinade is soooooo good..i think it's the combination of all the ingredients that makes this so tasty.")


# http://allrecipes.com/recipe/25224/classic-bran-muffins/?internalSource=rotd&referringId=78&referringContentType=recipe%20hub&clickId=cardslot%201

Recipe.create!(
  title: 'Classic Bran Muffins',
  description: 'A delicious source of fiber! My family have them almost every morning. Great healthy muffins! You may substitute dates for the raisins if you wish.',
  ingredients: '1 1/2 cups wheat bran#@!1 cup buttermilk#@!1/3 cup vegetable oil#@!1 egg#@!2/3 cup brown sugar#@!1/2 teaspoon vanilla extract#@!1 cup all-purpose flour#@!1 teaspoon baking soda#@!1 teaspoon baking powder#@!1/2 teaspoon salt#@!1/2 cup raisins',
  user_id: (1..user_count).to_a.sample,
  category_id: 1,
  prep_time: 20,
  cook_time: 20,
  steps_attributes: [{
    body: '0Preheat oven to 375 degrees F (190 degrees C). Grease muffin cups or line with paper muffin liners.',
    order:0
  }, {
    body: '0Mix together wheat bran and buttermilk; let stand for 10 minutes.',
    order:1
  }, {
    body: '0Beat together oil, egg, sugar and vanilla and add to buttermilk/bran mixture. Sift together flour, baking soda, baking powder and salt. Stir flour mixture into buttermilk mixture, until just blended. Fold in raisins and spoon batter into prepared muffin tins.',
    order:2
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473213478/994312_bzv9au.jpg',
    order:3
  }, {
    body: '0Bake for 15 to 20 minutes, or until a toothpick inserted into the center of a muffin comes out clean. Cool and enjoy!',
    order:4
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473213478/1125062_fsfxvy.jpg',
    order:5
  }
  ]
)

Comment.create!(recipe_id: 25, user_id: (1..user_count).to_a.sample, content: "I’ve made this recipe every week since finding it. This is a great recipe on its own, but I’ve found it a wonderful launch into my own creativity in healthful cooking.")
Comment.create!(recipe_id: 25, user_id: (1..user_count).to_a.sample, content: "Mmmm - these are good!")
Comment.create!(recipe_id: 25, user_id: (1..user_count).to_a.sample, content: "These were delicious. I changed the recipe to make them a little healthier, like others suggested. I substituted the oil with 1/3 applesauce.")
Comment.create!(recipe_id: 25, user_id: (1..user_count).to_a.sample, content: "I am pastry chef and I served this for a breakfast party this morning. These muffins are excellent! They were moist and very tasty!")
Comment.create!(recipe_id: 25, user_id: (1..user_count).to_a.sample, content: "These were great bran muffins! I decided to experiment, so I made one regular batch and then one lowfat with egg whites for the egg, applesauce for the oil, and reduced fat buttermilk.")
Comment.create!(recipe_id: 25, user_id: (1..user_count).to_a.sample, content: "Yummy! I used 1/2 cup dried cherries but think it would have been even better with 3/4 cup. Can't wait to try these with dried strawberries, blueberries or cranberries!")
Comment.create!(recipe_id: 25, user_id: (1..user_count).to_a.sample, content: "I substituted 1/3 cup applesauce for oil and made my own buttermilk using 1 tablespoon vinegar and enough milk to make 1 cup.")


# http://allrecipes.com/recipe/16895/fluffy-french-toast/?internalSource=hub%20recipe&referringId=78&referringContentType=recipe%20hub&clickId=cardslot%2019
Recipe.create!(
  title: 'Fluffy French Toast',
  description: 'This French toast recipe is different because it uses flour. I have given it to some friends and they\'ve all liked it better than the French toast they usually make!',
  ingredients: '1/4 cup all-purpose flour#@!1 cup milk#@!1 pinch salt#@!3 eggs#@!1/2 teaspoon ground cinnamon#@!1 teaspoon vanilla extract#@!1 tablespoon white sugar#@!12 thick slices bread',
  user_id: (1..user_count).to_a.sample,
  category_id: 1,
  prep_time: 10,
  cook_time: 20,
  steps_attributes: [{
    body: '0Measure flour into a large mixing bowl. Slowly whisk in the milk. Whisk in the salt, eggs, cinnamon, vanilla extract and sugar until smooth.',
    order:0
  }, {
    body: '0Heat a lightly oiled griddle or frying pan over medium heat.',
    order:1
  }, {
    body: '0Soak bread slices in mixture until saturated. Cook bread on each side until golden brown. Serve hot.',
    order:2
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473287729/3870262_ibabg8.jpg',
    order:3
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473287727/2049275_rqqxph.jpg',
    order:4
  }
  ]
)

Comment.create!(recipe_id: 26, user_id: (1..user_count).to_a.sample, content: "I love this recipe, and I had been searching for a good French toast recipe for a while. This one is the winner of all those I've tried.")
Comment.create!(recipe_id: 26, user_id: (1..user_count).to_a.sample, content: "This is the only way I'll make my french toastWe enjoyed the idea and tweaked the recipe a little;we doubled the cinnamon,added 2 pureed bananas and shot of dark rum to the mixture.Grand Marnier works well too.That'll cure what ails ya!!. It tastes like a restaurant's. The flour is the secret.")
Comment.create!(recipe_id: 26, user_id: (1..user_count).to_a.sample, content: "Wow, LOVED this recipe! In reading a LOT of reviews last night, the common theme seemed to be to double the vanilla and the cinnamon so I did.")
Comment.create!(recipe_id: 26, user_id: (1..user_count).to_a.sample, content: "We enjoyed the idea and tweaked the recipe a little;we doubled the cinnamon,added 2 pureed bananas and shot of dark rum to the mixture.Grand Marnier works well too.That'll cure what ails ya!!")
Comment.create!(recipe_id: 26, user_id: (1..user_count).to_a.sample, content: "Delicious! Every french toast recipe I've ever used turned out soggy, but not this one. I added more cinnamon (1 1/2 tsp total) and an extra tsp. of vanilla.")
Comment.create!(recipe_id: 26, user_id: (1..user_count).to_a.sample, content: "OMG! I love french toast and thought that my recipe was great until I tried this one. The addition of flour made me curious to try it and I'm glad that I did. It really made a difference.")
Comment.create!(recipe_id: 26, user_id: (1..user_count).to_a.sample, content: "Great recipe for french toast! I never thought flour would make a difference - but it thickens up the egg mixture nicely.")
Comment.create!(recipe_id: 26, user_id: (1..user_count).to_a.sample, content: "This recipe got rave reviews from everyone (including my best friend's little 2 year old :-P). The flavor and texture were perfect.")


# http://allrecipes.com/recipe/20177/todds-famous-blueberry-pancakes/?internalSource=recipe%20hub&referringId=78&referringContentType=recipe%20hub&clickId=cardslot%2025
Recipe.create!(
  title: 'Todd\'s Famous Blueberry Pancakes',
  description: 'My husband makes the most fabulous pancakes I\'ve ever eaten! Well worth the hour wait! We serve them with butter and brown sugar.',
  ingredients: '1 1/4 cups all-purpose flour#@!1/2 teaspoon salt#@!1 tablespoon baking powder#@!1 1/4 teaspoons white sugar#@!1 egg#@!1 cup milk#@!1/2 tablespoon butter, melted#@!1/2 cup frozen blueberries, thawed',
  user_id: (1..user_count).to_a.sample,
  category_id: 1,
  prep_time: 10,
  cook_time: 15,
  steps_attributes: [{
    body: '0In a large bowl, sift together flour, salt, baking powder and sugar. In a small bowl, beat together egg and milk. Stir milk and egg into flour mixture. Mix in the butter and fold in the blueberries. Set aside for 1 hour.',
    order:0
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473288099/3842475_nhxpgr.jpg',
    order:1
  }, {
    body: '0Heat a lightly oiled griddle or frying pan over medium high heat. Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.',
    order:2
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473288099/1882197_cpvonv.jpg',
    order:3
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473288099/686460_qhuszg.jpg',
    order:4
  }
  ]
)

Comment.create!(recipe_id: 27, user_id: (1..user_count).to_a.sample, content: "Can you say \"YUM\"? This is a top of the line blueberry pancake recipe. It always comes out perfect--fluffy, yet not cake-like. It's very moist with the blueberries; not a dry pancake at all.")
Comment.create!(recipe_id: 27, user_id: (1..user_count).to_a.sample, content: "This recipe is amazing. I have made it several times for several people and they all agree it is GREAT! It is very easy to make and the brown sugar & butter topping is yummy. ")
Comment.create!(recipe_id: 27, user_id: (1..user_count).to_a.sample, content: "GREAT WORTH THE WAIT. USE FRESH BERRIES.")
Comment.create!(recipe_id: 27, user_id: (1..user_count).to_a.sample, content: "The pancakes didn't have much flavor. I definitely needed syrup to be able to eat them. I liked the texture of it though. Very easy to make, indeed. You must drain blueberries.")
Comment.create!(recipe_id: 27, user_id: (1..user_count).to_a.sample, content: "Great blueberry pancakes! Will make again.")
Comment.create!(recipe_id: 27, user_id: (1..user_count).to_a.sample, content: "terrific pancakes, well worth the hour wait. I liked them with the butter and brown sugar. My husband preferred syrup. Also I used fresh blueberries.")
Comment.create!(recipe_id: 27, user_id: (1..user_count).to_a.sample, content: "My batch of pancakes turned out fabulous. They were fluffy and had a good consistency. I loved the recipe, but I added more sugar.")
Comment.create!(recipe_id: 27, user_id: (1..user_count).to_a.sample, content: "I thought that this recipe was great! You do have to plan ahead for the hour wait, but the fluffy raised texture of the pancakes is worth it.")


# http://allrecipes.com/recipe/221131/baked-buffalo-chicken-dip/?internalSource=staff%20pick&referringId=76&referringContentType=recipe%20hub&clickId=cardslot%204
Recipe.create!(
  title: 'Baked Buffalo Chicken Dip',
  description: 'You can\'t keep showing up at these Super Bowl parties with a bag of chips every year. So, if you\'re ready to go from snack scrub to appetizer all-star, then give this great baked dip a try.',
  ingredients: '3 cups diced cooked rotisserie chicken#@!2 (8 ounce) packages cream cheese, softened#@!3/4 cup hot pepper sauce (such as Frank\'s RedHot®)#@!1/2 cup shredded pepper Jack cheese#@!1/2 cup blue cheese dressing#@!1/2 cup crumbled blue cheese#@!1/2 teaspoon seafood seasoning (such as Old Bay®)#@!1 pinch cayenne pepper, or to taste#@!2 tablespoons shredded pepper Jack cheese#@!1 pinch cayenne pepper, for garnish',
  user_id: (1..user_count).to_a.sample,
  category_id: 2,
  prep_time: 15,
  cook_time: 15,
  steps_attributes: [{
    body: '0Preheat oven to 400 degrees F (200 degrees C).',
    order:0
  }, {
    body: '0Combine chicken, cream cheese, hot pepper sauce, 1/2 cup pepper Jack cheese, blue cheese dressing, crumbled blue cheese, seafood seasoning, and cayenne pepper in a large bowl.',
    order:1
  }, {
    body: '0Transfer chicken mixture to a 9-inch round baking dish and sprinkle with 2 tablespoons pepper Jack cheese.',
    order:2
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473286354/963308_dyxfyl.jpg',
    order:3
  }, {
    body: '0Bake until lightly browned, 15 to 20 minutes. Remove from oven and garnish with cayenne pepper.',
    order:4
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473286354/2661543_sieosd.jpg',
    order:4
  }
  ]
)

Comment.create!(recipe_id: 28, user_id: (1..user_count).to_a.sample, content: "I'm rating this 4 stars but don't get me wrong, it's very addictive, just be sure everyone in your group loves blue cheese. I prefer the original Frank's recipe which is on this site.")
Comment.create!(recipe_id: 28, user_id: (1..user_count).to_a.sample, content: "I made this dip back on Super Bowl Sunday for a potluck party and got mixed reviews.")
Comment.create!(recipe_id: 28, user_id: (1..user_count).to_a.sample, content: "Delicious! I made this last night to bring over to my friends house and we just couldn't stop eating it. Thanks for the great recipe.")
Comment.create!(recipe_id: 28, user_id: (1..user_count).to_a.sample, content: "I found a way to make EVERYONE happy! I made 1 1/2 recipes. With half of the mix I used pepper jack cheese, blue cheese dressing and a scant 1/4C blue cheese crumbles.")
Comment.create!(recipe_id: 28, user_id: (1..user_count).to_a.sample, content: "Made this for a family get-together and everyone raved about it. It's very addicting. Only thing I did different was to substitute ranch dressing for the blue cheese dressing")
Comment.create!(recipe_id: 28, user_id: (1..user_count).to_a.sample, content: "I made this quick and easy recipe today for a birthday party and it was amazing! I used everything except for the crumbled blue cheese.")
Comment.create!(recipe_id: 28, user_id: (1..user_count).to_a.sample, content: "Huge hit! I made it the night before and couldn't stop eating it cold straight out of the fridge. I left out the cayenne, cut the hot sauce to 1/2 C, and used cheddar/jack")
Comment.create!(recipe_id: 28, user_id: (1..user_count).to_a.sample, content: "I made this for a Super Bowl party--no substitutions. It was fantastic! Even my super picky boyfriend and friend who doesn't like blue cheese got seconds. ")
Comment.create!(recipe_id: 28, user_id: (1..user_count).to_a.sample, content: "OH MY WORD. SO GOOD. I made this exactly as written and my super bowl party loved it. It's got the right amount of spicy and savory and ... yummy.")


# http://allrecipes.com/recipe/228048/strawberry-goat-cheese-bruschetta/?internalSource=staff%20pick&referringId=76&referringContentType=recipe%20hub&clickId=cardslot%205
Recipe.create!(
  title: 'Strawberry Goat Cheese Bruschetta',
  description: 'The way the tangy, slightly salty goat cheese works with the syrupy, balsamic-coated strawberries and crispy, charred bread is a thing of beauty.',
  ingredients: '1/2 cup balsamic vinegar#@!12 slices Italian bread#@!1 tablespoon olive oil#@!1 pound strawberries, washed and diced#@!2 teaspoons fresh thyme leaves, plus more for serving#@!1 cup goat cheese, room temperature#@!salt and freshly ground pepper to taste',
  user_id: (1..user_count).to_a.sample,
  category_id: 2,
  prep_time: 10,
  cook_time: 15,
  steps_attributes: [{
    body: '0Heat vinegar in a small skillet over medium-low heat. Simmer until reduced by about half, 8 to 10 minutes. Remove from heat and allow to cool to room temperature.',
    order:0
  }, {
    body: '0Prepare a grill for high heat. Place bread slices on a foil-lined baking sheet and drizzle with olive oil.',
    order:1
  }, {
    body: '0Combine strawberries and thyme in a small bowl and set aside.',
    order:2
  }, {
    body: '0Grill bread on the preheated grill until browned, about 3 minutes per side.',
    order:3
  }, {
    body: '0Spread goat cheese on toasted bread. Add black pepper, salt, and reduced vinegar to the strawberry mixture. Spoon over the goat cheese topped bruschetta. Garnish with additional thyme.',
    order:4
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473286704/1022906_kxuqms.jpg',
    order:5
  }
  ]
)

Comment.create!(recipe_id: 29, user_id: (1..user_count).to_a.sample, content: "Let me make this perfectly clear....I Don't like goat cheese, too earthy. I don't like strawberries, too many little seeds to get caught in my teeth.")
Comment.create!(recipe_id: 29, user_id: (1..user_count).to_a.sample, content: "I have made this using basil instead of the thyme and its amazing!!! People always ask me for the recipe.")
Comment.create!(recipe_id: 29, user_id: (1..user_count).to_a.sample, content: "Good. I had some trouble reducing the vinegar, it turned hard fast. But the flavors came together well in the end.")
Comment.create!(recipe_id: 29, user_id: (1..user_count).to_a.sample, content: "Tastes fan-freakin'-tastic. The saucy cut-up fruit does not travel well. Wait til it's the last possible moment to mix it up.")
Comment.create!(recipe_id: 29, user_id: (1..user_count).to_a.sample, content: "I had some goat cheese that I wanted to use, so I tried this recipe.")
Comment.create!(recipe_id: 29, user_id: (1..user_count).to_a.sample, content: "This is outstanding!!! I am afraid of our grill, so I toasted the bread in the oven, but otherwise followed the directions exactly.")
Comment.create!(recipe_id: 29, user_id: (1..user_count).to_a.sample, content: "These are amazing!! We took the advice of another and used basil instead of thyme. My kids 12 & 7 ask for these daily and even the picky hubs likes them too. Thanks for the great recipe!")
Comment.create!(recipe_id: 29, user_id: (1..user_count).to_a.sample, content: "I enjoyed this but thought the thyme was a little overpowering for my taste. I am going to make again using basil.")
Comment.create!(recipe_id: 29, user_id: (1..user_count).to_a.sample, content: "Don't change one single thing. Absolutely delicious. I just served it to my book club pals. Huge hit! And my 11 year-old twins loved helping me make it. Thank you!")

# http://allrecipes.com/recipe/26692/annies-fruit-salsa-and-cinnamon-chips/?internalSource=hub%20recipe&referringId=76&referringContentType=recipe%20hub&clickId=cardslot%2014
Recipe.create!(
  title: 'Annie\'s Fruit Salsa and Cinnamon Chips',
  description: 'Easy to make, tasty fruit salsa and cinnamon tortilla chips. Great as an appetizer or a snack. Great for anytime!',
  ingredients: '2 kiwis, peeled and diced#@!2 Golden Delicious apples - peeled, cored and diced#@!8 ounces raspberries#@!1 pound strawberries#@!2 tablespoons white sugar#@!1 tablespoon brown sugar#@!3 tablespoons fruit preserves, any flavor#@!10 (10 inch) flour tortillas#@!butter flavored cooking spray#@!2 tablespoons cinnamon sugar',
  user_id: (1..user_count).to_a.sample,
  category_id: 2,
  prep_time: 15,
  cook_time: 10,
  steps_attributes: [{
    body: '0In a large bowl, thoroughly mix kiwis, Golden Delicious apples, raspberries, strawberries, white sugar, brown sugar and fruit preserves. Cover and chill in the refrigerator at least 15 minutes.',
    order:0
  }, {
    body: '0Preheat oven to 350 degrees F (175 degrees C).',
    order:1
  }, {
    body: '0Coat one side of each flour tortilla with butter flavored cooking spray. Cut into wedges and arrange in a single layer on a large baking sheet. Sprinkle wedges with desired amount of cinnamon sugar. Spray again with cooking spray.',
    order:2
  }, {
    body: '0Bake in the preheated oven 8 to 10 minutes. Repeat with any remaining tortilla wedges. Allow to cool approximately 15 minutes. Serve with chilled fruit mixture.',
    order:3
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473287227/829527_i60duf.jpg',
    order:4
  }
  ]
)

Comment.create!(recipe_id: 30, user_id: (1..user_count).to_a.sample, content: "I loved this, but made some changes after reading ALL of the reviews and making it several times. To cut back on the sweetness and on the juice, I used NO added sugar in the fruit.")
Comment.create!(recipe_id: 30, user_id: (1..user_count).to_a.sample, content: "Here's a tip to save time chopping: Buy an egg slicer (available on the kitchen aisle of most grocery stores for about $4). It works great on strawberries!!!")
Comment.create!(recipe_id: 30, user_id: (1..user_count).to_a.sample, content: "I have made this recipe numerous times & everyone ALWAYS LOVES IT! It can take some time to make. I recommend chopping fruit with a food chopper (pampered chef has an excellent one). ")
Comment.create!(recipe_id: 30, user_id: (1..user_count).to_a.sample, content: "I made the chips 2 days ahead of time and the salsa the morning of. I was worried since the fruit was out of season, but it turned out great!")
Comment.create!(recipe_id: 30, user_id: (1..user_count).to_a.sample, content: "Very tasty! I cut the sugars in half, used plain ol' grape jelly and added blueberries...YUM.")
Comment.create!(recipe_id: 30, user_id: (1..user_count).to_a.sample, content: "Have made several times, all with rave reviews. Don't have time to make the tortilla chips??? Substitute them with cinnamon graham crackers.")
Comment.create!(recipe_id: 30, user_id: (1..user_count).to_a.sample, content: "WOW...USED GRANNY SMITH APPLES,STRAWBERRIES,RASBERRIES,KIWI,AND PLUMS.STRAWBERRY PRESERVES GAVE IT A NICE COLOR.MADE THE NIGHT BEFORE.")

# http://allrecipes.com/recipe/72815/fresh-cherry-cobbler/?internalSource=staff%20pick&referringId=79&referringContentType=recipe%20hub&clickId=cardslot%202
Recipe.create!(
  title: 'Fresh Cherry Cobbler',
  description: 'This is a delicious cherry cobbler made with fresh cherries instead of canned. It may take a little longer to make because you need to pit the cherries, but it is well worth it when you taste the finished product.',
  ingredients: '1/2 cup butter#@!1 cup all-purpose flour#@!1 cup white sugar#@!1 teaspoon baking powder#@!1 cup milk#@!2 cups pitted sour cherries#@!3/4 cup white sugar#@!1 tablespoon all-purpose flour',
  user_id: (1..user_count).to_a.sample,
  category_id: 3,
  prep_time: 60,
  cook_time: 60,
  steps_attributes: [{
    body: '0Preheat the oven to 350 degrees F (175 degrees C). Place the butter in a 9x13 inch baking dish, and place in the oven to melt while the oven is preheating. Remove as soon as butter has melted, about 5 minutes.',
    order:0
  }, {
    body: '0In a medium bowl, stir together 1 cup of flour, 1 cup of sugar, and baking powder. Mix in the milk until well blended, then pour the batter into the pan over the butter. Do not stir.',
    order:1
  }, {
    body: '0Rinse out the bowl from the batter, and dry. Place cherries into the bowl, and toss with the remaining 3/4 cup of sugar and 1 tablespoon of flour. Distribute the cherry mixture evenly over the batter. Do not stir.',
    order:2
  }, {
    body: '0Bake for 50 to 60 minutes in the preheated oven, until golden brown. A toothpick inserted into the cobber should come out clean.',
    order:3
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473291437/1035865_cghrgg.jpg',
    order:4
  }
  ]
)

Comment.create!(recipe_id: 31, user_id: (1..user_count).to_a.sample, content: "OUTSTANDING! I followed reviewers' suggestions and used 1/2 cup less sugar, more cherries, added a tsp of Pampered Chef Cinnamon Plus spice blend, and a tsp of vanilla.")
Comment.create!(recipe_id: 31, user_id: (1..user_count).to_a.sample, content: "Wonderful! I picked up a pail of Door County Wisconsin cherries while on vacation and have made this four times (for myself and to share with others)")
Comment.create!(recipe_id: 31, user_id: (1..user_count).to_a.sample, content: "I hate to give something a bad review but I really did not like this recipe. I expected cobbler to have a biscut-like drop dough. This is more like a sponge cake or an upside-down cake.")
Comment.create!(recipe_id: 31, user_id: (1..user_count).to_a.sample, content: "Thank you for this recipe -- it has been a huge hit.")
Comment.create!(recipe_id: 31, user_id: (1..user_count).to_a.sample, content: "I used sweet cherries and also halved both sugar amounts. Very tasty. I used 2% milk which worked great.")
Comment.create!(recipe_id: 31, user_id: (1..user_count).to_a.sample, content: "Wow - easy and delicious! Plus it uses \"fresh\" fruit vs. canned which makes a huge difference.")
Comment.create!(recipe_id: 31, user_id: (1..user_count).to_a.sample, content: "Sour cherries are in season & we’re fortunate to have an orchard full of them quite close. (They also offer free cherry pitting to boot!) This cobbler recipe is easy & really delicious.")
Comment.create!(recipe_id: 31, user_id: (1..user_count).to_a.sample, content: "Wonderful! this was a huge hit... got future hubbie to pit the cherries! I used only 3/4 cup sugar in the base and only 1/2 cup in the cherries - and it was wonderful.")


# http://allrecipes.com/recipe/12682/apple-pie-by-grandma-ople/?internalSource=hub%20recipe&referringId=79&referringContentType=recipe%20hub&clickId=cardslot%2015
Recipe.create!(
  title: 'Apple Pie by Grandma Ople',
  description: 'This was my grandmother\'s apple pie recipe. I have never seen another one quite like it. It will always be my favorite and has won me several first place prizes in local competitions. I hope it becomes one of your favorites as well!',
  ingredients: '1 recipe pastry for a 9 inch double crust pie#@!1/2 cup unsalted butter#@!3 tablespoons all-purpose flour#@!1/4 cup water#@!1/2 cup white sugar#@!1/2 cup packed brown sugar#@!8 Granny Smith apples - peeled, cored and sliced',
  user_id: (1..user_count).to_a.sample,
  category_id: 3,
  prep_time: 30,
  cook_time: 60,
  steps_attributes: [{
    body: '0Preheat oven to 425 degrees F (220 degrees C). Melt the butter in a saucepan. Stir in flour to form a paste. Add water, white sugar and brown sugar, and bring to a boil. Reduce temperature and let simmer.',
    order:0
  }, {
    body: '0Place the bottom crust in your pan. Fill with apples, mounded slightly. Cover with a lattice work crust. Gently pour the sugar and butter liquid over the crust. Pour slowly so that it does not run off.',
    order:1
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473291749/3917180_pscczp.jpg',
    order:2
  }, {
    body: '0Bake 15 minutes in the preheated oven. Reduce the temperature to 350 degrees F (175 degrees C). Continue baking for 35 to 45 minutes, until apples are soft.',
    order:3
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473291748/736203_gjce7j.jpg',
    order:4
  }
  ]
)

Comment.create!(recipe_id: 32, user_id: (1..user_count).to_a.sample, content: "A++ Decadently Delicious! Ive tried many recipes from this site, all of them pleasing. But this is the first time I've ever been so inspired by one to write a review!")
Comment.create!(recipe_id: 32, user_id: (1..user_count).to_a.sample, content: "Believe the hype. I made this for the first time for a dinner party I had last week - mostly because I wanted to see what all the fuss was about. And it did not disappoint.")
Comment.create!(recipe_id: 32, user_id: (1..user_count).to_a.sample, content: "WONDERFUL PIE!!! I heeded other's warnings and suggestions on this one. 1. I baked the pie at 350 degreees for the entire time to minimize scorching.")
Comment.create!(recipe_id: 32, user_id: (1..user_count).to_a.sample, content: "Delicious! It came out perfect, though I did not lattice the crust. I just put some decorative cuts into it...obviously won't change the taste, just the look.")
Comment.create!(recipe_id: 32, user_id: (1..user_count).to_a.sample, content: "Delicious, I loved how gooey this pie filling is! I did cheat and used store bought pie dough for the crust.")
Comment.create!(recipe_id: 32, user_id: (1..user_count).to_a.sample, content: "This past weekend 9/6 - 9/8/02 I made this pie for the Hillsboro County Fair in New Hampshire and won the First Prize Blue Ribbon.")
Comment.create!(recipe_id: 32, user_id: (1..user_count).to_a.sample, content: "I've made good apple pies for decades. :-) This is an excellent-tasting apple pie and stellar-looking as well.")
Comment.create!(recipe_id: 32, user_id: (1..user_count).to_a.sample, content: "Epic Recipe. After you taste this you'll understand how Lando Calrissian and Nien Nunb felt after they destroyed the 2nd Death Star.")
Comment.create!(recipe_id: 32, user_id: (1..user_count).to_a.sample, content: "Grandma Ople was right: this pie doesn't need vanilla, cinnamon and/or nutmeg. In fact, those extra ingredients just ruin the subtlety of the flavour and overpower it.")


# http://allrecipes.com/recipe/7565/too-much-chocolate-cake/?internalSource=hub%20recipe&referringId=79&referringContentType=recipe%20hub&clickId=cardslot%2020
Recipe.create!(
  title: 'Too Much Chocolate Cake',
  description: 'This cake won me First Prize at the county fair last year. It is very chocolaty.',
  ingredients: '1 (18.25 ounce) package devil\'s food cake mix#@!1 (5.9 ounce) package instant chocolate pudding mix#@!1 cup sour cream#@!1 cup vegetable oil#@!4 eggs#@!1/2 cup warm water#@!2 cups semisweet chocolate chips',
  user_id: (1..user_count).to_a.sample,
  category_id: 3,
  prep_time: 20,
  cook_time: 60,
  steps_attributes: [{
    body: '0Preheat oven to 350 degrees F (175 degrees C).',
    order:0
  }, {
    body: '0In a large bowl, mix together the cake and pudding mixes, sour cream, oil, beaten eggs and water. Stir in the chocolate chips and pour batter into a well greased 12 cup bundt pan.',
    order:1
  }, {
    body: '0Bake for 50 to 55 minutes, or until top is springy to the touch and a wooden toothpick inserted comes out clean. Cool cake thoroughly in pan at least an hour and a half before inverting onto a plate If desired, dust the cake with powdered sugar.',
    order:2
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473292075/1130307_mndcab.jpg',
    order:3
  }
  ]
)

Comment.create!(recipe_id: 33, user_id: (1..user_count).to_a.sample, content: "Cut the calories and this cake still tastes awesome. ")
Comment.create!(recipe_id: 33, user_id: (1..user_count).to_a.sample, content: "Very, very moist, rich cake. Followed recipe exactly. This is going to become a standard at our house. Perfect with a dusting of powdered sugar and a cold glass of milk.")
Comment.create!(recipe_id: 33, user_id: (1..user_count).to_a.sample, content: "Delicious! I made this for my mom's birthday and it was a big hit! Slight changes: I used a dark chocolate fudge cake mix, with 1/2 cup veg.")
Comment.create!(recipe_id: 33, user_id: (1..user_count).to_a.sample, content: "I had to make a second cake. The recipe has too much oil and would not cook completely without the outside being overdone. Cooked it again with 1/2 the oil and it was great.")
Comment.create!(recipe_id: 33, user_id: (1..user_count).to_a.sample, content: "I was hesitant because I always cook from scratch. But I've had so much trouble lately with getting my chocolate cakes moist because of the high altitude I'm at, so I'll try anything.")
Comment.create!(recipe_id: 33, user_id: (1..user_count).to_a.sample, content: "This chocolate cake is phenomenal! I have been making this for about 2 years now for many, many different occasions, and it always gets rave reviews.")
Comment.create!(recipe_id: 33, user_id: (1..user_count).to_a.sample, content: "Thanks for posting this recipe, Denise. It's a keeper for me. I can say that for me, it is just almost too much chocolate cake.")


# http://allrecipes.com/recipe/67952/roasted-brussels-sprouts/?internalSource=hub%20recipe&referringId=87&referringContentType=recipe%20hub&clickId=cardslot%2020
Recipe.create!(
  title: 'Roasted Brussels Sprouts',
  description: 'This recipe is from my mother. It may sound strange, but these are really good and very easy to make. The Brussels sprouts should be brown with a bit of black on the outside when done. Any leftovers can be reheated or even just eaten cold from the fridge. I don\'t know how, but they taste sweet and salty at the same time!',
  ingredients: '1 1/2 pounds Brussels sprouts, ends trimmed and yellow leaves removed#@!3 tablespoons olive oil#@!1 teaspoon kosher salt#@!1/2 teaspoon freshly ground black pepper',
  user_id: (1..user_count).to_a.sample,
  category_id: 4,
  prep_time: 15,
  cook_time: 45,
  steps_attributes: [{
    body: '0Preheat oven to 400 degrees F (205 degrees C).',
    order:0
  }, {
    body: '0Place trimmed Brussels sprouts, olive oil, kosher salt, and pepper in a large resealable plastic bag. Seal tightly, and shake to coat. Pour onto a baking sheet, and place on center oven rack.',
    order:1
  }, {
    body: '0Roast in the preheated oven for 30 to 45 minutes, shaking pan every 5 to 7 minutes for even browning. Reduce heat when necessary to prevent burning. Brussels sprouts should be darkest brown, almost black, when done. Adjust seasoning with kosher salt, if necessary. Serve immediately.',
    order:2
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473295875/812447_sp0kma.jpg',
    order:3
  }
  ]
)

Comment.create!(recipe_id: 34, user_id: (1..user_count).to_a.sample, content: "Yum, yum, yum!!! I cooked them at 450 (misread it!) and they turned out fabulous. Brown and a little crunchy on the outside and creamy and tender on the inside.")
Comment.create!(recipe_id: 34, user_id: (1..user_count).to_a.sample, content: "AWESOME AWESOME AWESOME...I was out of plastic zipper bags(how did that happen????) so I poured the oil/salt/pepper in the pan and shook it up...worked equally as well.")
Comment.create!(recipe_id: 34, user_id: (1..user_count).to_a.sample, content: "I thought this was delicious as printed, but my partner did not care for these until I started roasting them in butter.")
Comment.create!(recipe_id: 34, user_id: (1..user_count).to_a.sample, content: "The Best! Sweet, Salty, Nutty....They were a hit! Not a sprout was left on the dish!")
Comment.create!(recipe_id: 34, user_id: (1..user_count).to_a.sample, content: "I just finished eating the leftovers reheated in the oven and HAD to share my experience. Both times now these sprouts have been the first thing to eat and finish on my plate...")
Comment.create!(recipe_id: 34, user_id: (1..user_count).to_a.sample, content: "This is a very simple recipe and combines the tastes of sweet and salty. It is an excellent side dish for many meats.")
Comment.create!(recipe_id: 34, user_id: (1..user_count).to_a.sample, content: "I have been making this recipe ever since i saw it in Ina Gartner's Barefoot Contessa recipe book. It is simple, healthy and delicious.")
Comment.create!(recipe_id: 34, user_id: (1..user_count).to_a.sample, content: "This is a simple and very tasty recipe which succeeds because of the contrasts in textures and flavors. We loved the contrasts: crunchy, salty outer leaves and creamy, subtley sweet sprouts.")


# http://allrecipes.com/recipe/73208/spinach-and-sun-dried-tomato-pasta/?internalSource=rotd&referringId=87&referringContentType=recipe%20hub&clickId=cardslot%201
Recipe.create!(
  title: 'Spinach and Sun-Dried Tomato Pasta',
  description: 'I created this simple Sicilian-style pasta dish one day when trying to use up some sun-dried tomatoes.',
  ingredients: '1 cup vegetable broth#@!12 dehydrated sun-dried tomatoes#@!1 (8 ounce) package uncooked penne pasta#@!2 tablespoons pine nuts#@!1 tablespoon olive oil#@!1/4 teaspoon crushed red pepper flakes#@!1 clove garlic, minced#@!1 bunch fresh spinach, rinsed and torn into bite-size pieces#@!1/4 cup grated Parmesan cheese',
  user_id: (1..user_count).to_a.sample,
  category_id: 4,
  prep_time: 15,
  cook_time: 25,
  steps_attributes: [{
    body: '0In a small saucepan, bring the broth to a boil. Remove from heat. Place the sun-dried tomatoes in the broth 15 minutes, or until softened. Drain, reserving broth, and coarsely chop.',
    order:0
  }, {
    body: '0Bring a large pot of lightly salted water to a boil. Place penne pasta in the pot, cook 9 to 12 minutes, until al dente, and drain.',
    order:1
  }, {
    body: '0Place the pine nuts in a skillet over medium heat. Cook and stir until lightly toasted.',
    order:2
  }, {
    body: '0Heat the olive oil and red pepper flakes in a skillet over medium heat, and saute the garlic 1 minute, until tender. Mix in the spinach, and cook until almost wilted. Pour in the reserved broth, and stir in the chopped sun-dried tomatoes. Continue cooking 2 minutes, or until heated through.',
    order:3
  }, {
    body: '0In a large bowl, toss the cooked pasta with the spinach and tomato mixture and pine nuts. Serve with Parmesan cheese.',
    order:4
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473292888/211950_v9d51d.jpg',
    order:5
  }
  ]
)

Comment.create!(recipe_id: 35, user_id: (1..user_count).to_a.sample, content: "Really easy and very tasty! Few changes: used chicken broth, oil packed tomatoes, doubled the garlic and pepper flakes, and added about a tbsp of fresh basil. Will make again.")
Comment.create!(recipe_id: 35, user_id: (1..user_count).to_a.sample, content: "One of my favorites ... very simple to prepare and tasty!")
Comment.create!(recipe_id: 35, user_id: (1..user_count).to_a.sample, content: "Lacking depth as is. If you want to make this dish taste like fine restaurant quality, do not reconstitute the sd tomatoes. Eliminate the broth altogether. Boil your penne to al dente.")
Comment.create!(recipe_id: 35, user_id: (1..user_count).to_a.sample, content: "Very good, very simple. I added some artichoke hearts and a little salt to taste. Toast the pine nuts and use 1 Tbsp per serving. As others have said, I would add a lot more spinach.")
Comment.create!(recipe_id: 35, user_id: (1..user_count).to_a.sample, content: "This recipe is great as written but if you have a little extra time I'd reccommend soaking the sun dried toms.")
Comment.create!(recipe_id: 35, user_id: (1..user_count).to_a.sample, content: "This pasta recipe is PERFECT! It was easily adaptable, simple to prepare and looked beautiful in the serving bowl! Here were my substitutions: I had no broth so I used water.")
Comment.create!(recipe_id: 35, user_id: (1..user_count).to_a.sample, content: "Ok...this was just plain AWESOME!!!! I made one addition...MUSHROOMS!!!!!!!!!!!! This dish was just screaming for them! Otherwise, did not alter anything...yum...yum..yum...YUM!!!!!!")


# http://allrecipes.com/recipe/47247/chili-rellenos-casserole/?internalSource=staff%20pick&referringId=87&referringContentType=recipe%20hub&clickId=cardslot%206
Recipe.create!(
  title: 'Chili Rellenos Casserole',
  description: 'This Chili Rellenos Casserole is very easy to prepare and is loaded with flavor. Great for a busy week night, and good enough for company.',
  ingredients: '2 (7 ounce) cans whole green chile peppers, drained#@!8 ounces Monterey Jack cheese, shredded#@!8 ounces Longhorn or Cheddar cheese, shredded#@!2 eggs, beaten#@!1 (5 ounce) can evaporated milk#@!2 tablespoons all-purpose flour#@!1/2 cup milk#@!1 (8 ounce) can tomato sauce',
  user_id: (1..user_count).to_a.sample,
  category_id: 4,
  prep_time: 15,
  cook_time: 45,
  steps_attributes: [{
    body: '0Preheat oven to 350 degrees F (175 degrees C). Spray a 9x13-inch baking dish with cooking spray.',
    order:0
  }, {
    body: '0Lay half of the chilies evenly in bottom of baking dish. Sprinkle with half of the Jack and Cheddar cheeses, and cover with remaining chilies. In a bowl, mix together the eggs, milk, and flour, and pour over the top of the chilies.',
    order:1
  }, {
    body: '0Bake in the preheated oven for 25 minutes. Remove from oven, pour tomato sauce evenly over the top, and continue baking another 15 minutes. Sprinkle with remaining Jack and Cheddar cheeses, and serve.',
    order:2
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473293183/634160_zxeii1.jpg',
    order:3
  }
  ]
)

Comment.create!(recipe_id: 36, user_id: (1..user_count).to_a.sample, content: "My husband and I love chiles rellenos, and I have tried to make them in the past, but they were just too much work. This casserole is perfect for us.")
Comment.create!(recipe_id: 36, user_id: (1..user_count).to_a.sample, content: "Great recipe. My mother-in-law said it was better than hers and that she would be using this recipe from now on. Everybody had seconds.")
Comment.create!(recipe_id: 36, user_id: (1..user_count).to_a.sample, content: "What a terrific recipe. I will make again and again. The only change would be to chop the green chilies rather than leaving them in whole pieces. Served this with tacos!")
Comment.create!(recipe_id: 36, user_id: (1..user_count).to_a.sample, content: "This recipe was so good. I added black olives for something different. I recommend it. :)")
Comment.create!(recipe_id: 36, user_id: (1..user_count).to_a.sample, content: "Made this without the tomato sauce but it was YUMMY anyway and a whole lot easier to make than the traditional chile rellenos.")
Comment.create!(recipe_id: 36, user_id: (1..user_count).to_a.sample, content: "I just prepared this recipe and it's delicious. It really tastes like a chili relleno. I wouldn't make any changes.")
Comment.create!(recipe_id: 36, user_id: (1..user_count).to_a.sample, content: "Yummy!!!!")
Comment.create!(recipe_id: 36, user_id: (1..user_count).to_a.sample, content: "Excellent! I am one for sortcuts. I bought the already shredded Mexican cheese in a bag. Open the cans, measure the ingredients. Whalla, in a matter of minutes ready to cook!")
Comment.create!(recipe_id: 36, user_id: (1..user_count).to_a.sample, content: "This is DELISH! I had forgotten about it. My Mom make this dish, with two exceptions. She uses diced chiles, and she adds 1/2 tsp garlic powder to the tomato sauce.")

# http://allrecipes.com/recipe/16066/awesome-slow-cooker-pot-roast/?internalSource=hub%20recipe&referringId=92&referringContentType=recipe%20hub&clickId=cardslot%2015
Recipe.create!(
  title: 'Awesome Slow Cooker Pot Roast',
  description: 'This is a very easy recipe for a delicious pot roast. It makes its own gravy. It\'s designed especially for the working person who does not have time to cook all day, but it tastes like you did. You\'ll want the cut to be between 5 and 6 pounds.',
  ingredients: '2 (10.75 ounce) cans condensed cream of mushroom soup#@!1 (1 ounce) package dry onion soup mix#@!1 1/4 cups water#@!5 1/2 pounds pot roast',
  user_id: (1..user_count).to_a.sample,
  category_id: 5,
  prep_time: 10,
  cook_time: 480,
  steps_attributes: [{
    body: '0In a slow cooker, mix cream of mushroom soup, dry onion soup mix and water. Place pot roast in slow cooker and coat with soup mixture.',
    order:0
  }, {
    body: '0Cook on High setting for 3 to 4 hours, or on Low setting for 8 to 9 hours.',
    order:1
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473293635/2505121_rj3znp.jpg',
    order:2
  }
  ]
)

Comment.create!(recipe_id: 37, user_id: (1..user_count).to_a.sample, content: "I used golden mushroom soup and added cut-up potatoes as I knew I wouldn't have time to fix them later. I removed the potatoes & mashed them-my 3 yr old loved them. There's plenty of gravy.")
Comment.create!(recipe_id: 37, user_id: (1..user_count).to_a.sample, content: "My husband always says my pot roast is his favorite, but after making it this way I will never make it another way again. The gravey was wonderful!")
Comment.create!(recipe_id: 37, user_id: (1..user_count).to_a.sample, content: "I actually converted non-potroast lovers with this one. (They'll never know my secret)")
Comment.create!(recipe_id: 37, user_id: (1..user_count).to_a.sample, content: "easy and delicious for the busy family!")
Comment.create!(recipe_id: 37, user_id: (1..user_count).to_a.sample, content: "My oldest daughter couldn't get enough of it. She loves it. my entire family thought it was delicious!:)")
Comment.create!(recipe_id: 37, user_id: (1..user_count).to_a.sample, content: "Yum... This makes a great gravy.")
Comment.create!(recipe_id: 37, user_id: (1..user_count).to_a.sample, content: "The name says it all")


# http://allrecipes.com/recipe/9023/baked-teriyaki-chicken/?internalSource=hub%20recipe&referringId=92&referringContentType=recipe%20hub&clickId=cardslot%2023
Recipe.create!(
  title: 'Baked Teriyaki Chicken',
  description: 'A much requested chicken recipe! Easy to double for a large group. Delicious!',
  ingredients: '1 tablespoon cornstarch#@!1 tablespoon cold water#@!1/2 cup white sugar#@!1/2 cup soy sauce#@!1/4 cup cider vinegar#@!1 clove garlic, minced#@!1/2 teaspoon ground ginger#@!1/4 teaspoon ground black pepper#@!12 skinless chicken thighs',
  user_id: (1..user_count).to_a.sample,
  category_id: 5,
  prep_time: 30,
  cook_time: 60,
  steps_attributes: [{
    body: '0In a small saucepan over low heat, combine the cornstarch, cold water, sugar, soy sauce, vinegar, garlic, ginger and ground black pepper. Let simmer, stirring frequently, until sauce thickens and bubbles.',
    order:0
  }, {
    body: '0Preheat oven to 425 degrees F (220 degrees C).',
    order:1
  }, {
    body: '0Place chicken pieces in a lightly greased 9x13 inch baking dish. Brush chicken with the sauce. Turn pieces over, and brush again.',
    order:2
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473294196/3914650_eyxwee.jpg',
    order:3
  }, {
    body: '0Bake in the preheated oven for 30 minutes. Turn pieces over, and bake for another 30 minutes, until no longer pink and juices run clear. Brush with sauce every 10 minutes during cooking.',
    order:4
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473294196/3588658_ttktbr.jpg',
    order:5
  }
  ]
)

Comment.create!(recipe_id: 38, user_id: (1..user_count).to_a.sample, content: "I love it! My husband love it! We'll definitely make this again.")
Comment.create!(recipe_id: 38, user_id: (1..user_count).to_a.sample, content: "Yummy, good enough to make a nice dinner out of, also deemed worthy of the Sunday Football Game, this dish will please ANY crowd, even my 2 year old daughter loved it!")
Comment.create!(recipe_id: 38, user_id: (1..user_count).to_a.sample, content: "This recipe was Delicious, and easy to make. I tried the sauce on grilled beef, and it was just as good. Thanks")
Comment.create!(recipe_id: 38, user_id: (1..user_count).to_a.sample, content: "This was absolutely delicious and pleased the whole family. Will definately be making this on a regular basis.")
Comment.create!(recipe_id: 38, user_id: (1..user_count).to_a.sample, content: "Very good recipe. Everybody liked it.")
Comment.create!(recipe_id: 38, user_id: (1..user_count).to_a.sample, content: "This is a wonderfully easy and delicious recipe. I will definitely be preparing this on a regular basis.")
Comment.create!(recipe_id: 38, user_id: (1..user_count).to_a.sample, content: "This was delicious, but next time I'm going to double the sauce!")
Comment.create!(recipe_id: 38, user_id: (1..user_count).to_a.sample, content: "This recipe was great for a dinner for two and was loved at my anniversary party as well (50 couples)! Great taste and an easy clean-up! I absolutely loved it (and so did everyone else)!")


# http://allrecipes.com/recipe/65896/zesty-slow-cooker-chicken-barbecue/?internalSource=hub%20recipe&referringId=92&referringContentType=recipe%20hub&clickId=cardslot%2029
Recipe.create!(
  title: 'Zesty Slow Cooker Chicken Barbecue',
  description: 'Use your slow cooker to prepare this great twist on basic barbecue chicken. Throw the chicken breasts in frozen, and serve with baked potatoes.',
  ingredients: '6 frozen skinless, boneless chicken breast halves#@!1 (12 ounce) bottle barbeque sauce#@!1/2 cup Italian salad dressing#@!1/4 cup brown sugar#@!2 tablespoons Worcestershire sauce',
  user_id: (1..user_count).to_a.sample,
  category_id: 5,
  prep_time: 10,
  cook_time: 240,
  steps_attributes: [{
    body: '0Place chicken in a slow cooker. In a bowl, mix the barbecue sauce, Italian salad dressing, brown sugar, and Worcestershire sauce. Pour over the chicken.',
    order:0
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473294547/3868403_ujvoby.jpg',
    order:1
  }, {
    body: '0Cover, and cook 3 to 4 hours on High or 6 to 8 hours on Low.',
    order:2
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473360332/fdfsdfag_psav4u.jpg',
    order:3
  }
  ]
)

Comment.create!(recipe_id: 39, user_id: (1..user_count).to_a.sample, content: "This was great everyone loved it! Super easy! Make sure you like the kind of dressing and BBQ sause you put in, it makes all the differance!")
Comment.create!(recipe_id: 39, user_id: (1..user_count).to_a.sample, content: "I love this sauce! The only change I made was to add about 1/2 cup of diced onion and 1 teaspoon of liquid smoke. I used Sweet Baby Ray's Honey barbecue sauce and the sauce was perfect.")
Comment.create!(recipe_id: 39, user_id: (1..user_count).to_a.sample, content: "excellent!!! Very quick and easy, what a great taste. I used dinosaur BBQ sauce.")
Comment.create!(recipe_id: 39, user_id: (1..user_count).to_a.sample, content: "Incredibly easy and really good. Uses ingredients I usually have on hand. Great served with rice to soak up some of the sauce.")
Comment.create!(recipe_id: 39, user_id: (1..user_count).to_a.sample, content: "Wonderful and easy! Defrosted chicken breasts worked fine, and the family asked for seconds. Thanks.")
Comment.create!(recipe_id: 39, user_id: (1..user_count).to_a.sample, content: "This recipes was extremely good!! I was looking for something easy to make at about 1:00 pm to make for dinner (not to mention I love my crock pot!!) and came upon this.")
Comment.create!(recipe_id: 39, user_id: (1..user_count).to_a.sample, content: "This was great! I used this sauce for country ribs instead (slow cooker) and it was the best. I used KC masterpiece. Thanks for the recipe.")
Comment.create!(recipe_id: 39, user_id: (1..user_count).to_a.sample, content: "This is one of those recipes that when you first look at it, you wonder why someone would put these ingredients together.")


# http://allrecipes.com/recipe/12720/grilled-salmon-i/?internalSource=hub%20recipe&referringId=93&referringContentType=recipe%20hub&clickId=cardslot%2013
Recipe.create!(
  title: 'Grilled Salmon',
  description: 'A simple soy sauce and brown sugar marinade, with hints of lemon and garlic, are the perfect salty-sweet complement to rich salmon fillets. Even my 9 year old loves this recipe!',
  ingredients: '1 1/2 pounds salmon fillets#@!lemon pepper to taste#@!garlic powder to taste#@!salt to taste#@!1/3 cup soy sauce#@!1/3 cup brown sugar#@!1/3 cup water#@!1/4 cup vegetable oil',
  user_id: (1..user_count).to_a.sample,
  category_id: 6,
  prep_time: 15,
  cook_time: 16,
  steps_attributes: [{
    body: '0Season salmon fillets with lemon pepper, garlic powder, and salt.',
    order:0
  }, {
    body: '0In a small bowl, stir together soy sauce, brown sugar, water, and vegetable oil until sugar is dissolved. Place fish in a large resealable plastic bag with the soy sauce mixture, seal, and turn to coat. Refrigerate for at least 2 hours.',
    order:1
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473294932/3649338_ujp4ky.jpg',
    order:2
  }, {
    body: '0Preheat grill for medium heat.',
    order:3
  }, {
    body: '0Lightly oil grill grate. Place salmon on the preheated grill, and discard marinade. Cook salmon for 6 to 8 minutes per side, or until the fish flakes easily with a fork.',
    order:4
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473294932/800839_ulzmb9.jpg',
    order:5
  }
  ]
)

Comment.create!(recipe_id: 40, user_id: (1..user_count).to_a.sample, content: "WONDERFUL!! We had friends over for dinner and they though we cooked steak! Wonderful taste - perfect for the salmon. I plan to use this marinade for other meats like pork or chicken.")
Comment.create!(recipe_id: 40, user_id: (1..user_count).to_a.sample, content: "This is a very easy delicious recipe. I made it for my in-laws and they couldn't stop talking about it. Even my very fussy 2 year old loved it.")
Comment.create!(recipe_id: 40, user_id: (1..user_count).to_a.sample, content: "My wife loved this recipe. She usually does not like salmon.")
Comment.create!(recipe_id: 40, user_id: (1..user_count).to_a.sample, content: "Simply the best salmon recipe we have EVER tried, and we eat a lot of salmon. Quick and easy.")
Comment.create!(recipe_id: 40, user_id: (1..user_count).to_a.sample, content: "This is a wonderful recipe! We love garlic, so I add 1-2 cloves chopped garlic, as well as some fish/poultry seasoning, to the marinade. The longer you marinate, the better!")
Comment.create!(recipe_id: 40, user_id: (1..user_count).to_a.sample, content: "very good and easy to prepare great dish for company I added a little balsamic vinegar for a little added flavor")
Comment.create!(recipe_id: 40, user_id: (1..user_count).to_a.sample, content: "Your right my 9 year old girl loves this. Great. Even my inlaws raved.")
Comment.create!(recipe_id: 40, user_id: (1..user_count).to_a.sample, content: "Great recipe. The salmon fillets had a wonderful flavor. Highly recommend it.")


# http://allrecipes.com/recipe/45833/ginger-glazed-mahi-mahi/?internalSource=hub%20recipe&referringId=93&referringContentType=recipe%20hub&clickId=cardslot%2021
Recipe.create!(
  title: 'Ginger Glazed Mahi Mahi',
  description: "This Ginger Glazed Mahi Mahi is bursting with flavor and combines both sweet and sour taste sensations. The 30 minute prep time includes 20 minutes to marinate. This recipe is a snap and so delicious. You'll love it!",
  ingredients: '3 tablespoons honey#@!3 tablespoons soy sauce#@!3 tablespoons balsamic vinegar#@!1 teaspoon grated fresh ginger root#@!1 clove garlic, crushed or to taste#@!2 teaspoons olive oil#@!4 (6 ounce) mahi mahi fillets#@!salt and pepper to taste#@!1 tablespoon vegetable oil',
  user_id: (1..user_count).to_a.sample,
  category_id: 6,
  prep_time: 5,
  cook_time: 12,
  steps_attributes: [{
    body: '0In a shallow glass dish, stir together the honey, soy sauce, balsamic vinegar, ginger, garlic and olive oil. Season fish fillets with salt and pepper, and place them into the dish. If the fillets have skin on them, place them skin side down. Cover, and refrigerate for 20 minutes to marinate.',
    order:0
  }, {
    body: '0Heat vegetable oil in a large skillet over medium-high heat. Remove fish from the dish, and reserve marinade. Fry fish for 4 to 6 minutes on each side, turning only once, until fish flakes easily with a fork. Remove fillets to a serving platter and keep warm.',
    order:1
  }, {
    body: '0Pour reserved marinade into the skillet, and heat over medium heat until the mixture reduces to a glaze consistently. Spoon glaze over fish, and serve immediately.',
    order:2
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473295257/958722_tztsdg.jpg',
    order:3
  }
  ]
)

Comment.create!(recipe_id: 41, user_id: (1..user_count).to_a.sample, content: "Great recipe! It was easy and delicious!")
Comment.create!(recipe_id: 41, user_id: (1..user_count).to_a.sample, content: "Wow! Superb glaze which would work well over chicken, pork, or steamed vegies. I am still thinking about the flavor!")
Comment.create!(recipe_id: 41, user_id: (1..user_count).to_a.sample, content: "This recipe was superb. The glaze is very flavorful and a perfect combo with the fish. I served it with a simple brown rice pilaf, green beans and whole grain rolls. Fabulous and healthy too!")
Comment.create!(recipe_id: 41, user_id: (1..user_count).to_a.sample, content: "This was very, very good...Kids even enjoyed it. Simple to prepare and quite a treat!!")
Comment.create!(recipe_id: 41, user_id: (1..user_count).to_a.sample, content: "My 10 year old boys and my wife (who doesn't like \"fish\") all loved this dish. I skipped the salt before adding to marinade and it was almost too salty. I would suggest low-sodium soy sauce.")
Comment.create!(recipe_id: 41, user_id: (1..user_count).to_a.sample, content: "This was awesome. I had to cook the fish fillets about twice as long as instructed...perhaps these fillets were thicker than most.")
Comment.create!(recipe_id: 41, user_id: (1..user_count).to_a.sample, content: "This was fabulous!!!! I am still thinking about it four days later. Even my kids and husband who do not like fish, loved this dish.")
Comment.create!(recipe_id: 41, user_id: (1..user_count).to_a.sample, content: "I just made this, and it's superb!! It's a perfect marinade for mahi mahi. It takes a fish that's hard to prepare right and makes it very easy and extremely good. Five stars easy!")


# http://allrecipes.com/recipe/74169/hudsons-baked-tilapia-with-dill-sauce/?internalSource=recipe%20hub&referringId=93&referringContentType=recipe%20hub&clickId=cardslot%2030
Recipe.create!(
  title: "Hudson's Baked Tilapia with Dill Sauce",
  description: 'Baked tilapia seasoned with Cajun and citrus served with a creamy sauce of fresh dill and lemon.',
  ingredients: '4 (4 ounce) fillets tilapia#@!salt and pepper to taste#@!1 tablespoon Cajun seasoning, or to taste#@!1 lemon, thinly sliced#@!1/4 cup mayonnaise#@!1/2 cup sour cream#@!1/8 teaspoon garlic powder#@!1 teaspoon fresh lemon juice#@!2 tablespoons chopped fresh dill',
  user_id: (1..user_count).to_a.sample,
  category_id: 6,
  prep_time: 10,
  cook_time: 20,
  steps_attributes: [{
    body: '0Preheat the oven to 350 degrees F (175 degrees C). Lightly grease a 9x13 inch baking dish.',
    order:0
  }, {
    body: '0Season the tilapia fillets with salt, pepper and Cajun seasoning on both sides. Arrange the seasoned fillets in a single layer in the baking dish. Place a layer of lemon slices over the fish fillets. I usually use about 2 slices on each piece so that it covers most of the surface of the fish.',
    order:1
  }, {
    body: '0Bake uncovered for 15 to 20 minutes in the preheated oven, or until fish flakes easily with a fork.',
    order:2
  }, {
    body: '0While the fish is baking, mix together the mayonnaise, sour cream, garlic powder, lemon juice and dill in a small bowl. Serve with tilapia.',
    order:3
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473295493/610360_kmg47t.jpg',
    order:4
  }
  ]
)

Comment.create!(recipe_id: 42, user_id: (1..user_count).to_a.sample, content: "this was really good and so easy! i made it without lemon slices ... just added a little lemon juice to the tilapia before baking. my husband liked it a lot too. will be making it again.")
Comment.create!(recipe_id: 42, user_id: (1..user_count).to_a.sample, content: "This recipe is easy, quick and great! The whole family loved it. There were no leftovers. I followed the recipe exactly as stated.")
Comment.create!(recipe_id: 42, user_id: (1..user_count).to_a.sample, content: "Great sauce! Easy recipe. Will make again.")
Comment.create!(recipe_id: 42, user_id: (1..user_count).to_a.sample, content: "used a little more crushed red pepper to spice it up a little more, and loved it. the dill sauce is great")
Comment.create!(recipe_id: 42, user_id: (1..user_count).to_a.sample, content: "WONDERFUL! A great spring/summer recipe. The dill sauce makes it so refreshing. Very delicious!")
Comment.create!(recipe_id: 42, user_id: (1..user_count).to_a.sample, content: "I thought this was very good. I did make some adjustments, however. Because my family dislikes mayo, I substituted plain yogurt instead. I also added some lemon zest and MSG to the sauce.")
Comment.create!(recipe_id: 42, user_id: (1..user_count).to_a.sample, content: "This was really delicious, just a little salty. I served these with rice.")


# http://allrecipes.com/recipe/6862/pumpkin-bread-iv/?internalSource=hub%20recipe&referringId=78&referringContentType=recipe%20hub&clickId=cardslot%2030
Recipe.create!(
  title: 'Pumpkin Bread',
  description: 'This is an all time, excellent, every time recipe. It is very simple, and so well loved by many. I make these for family, friends, school functions, work functions, for gifts etc. It has always been raved about - even by kids! I recommend bringing this to your Thanksgiving function; you will be thanked many times for this delicious taste treat. This is a large quantity, but you will end up making this size batch more than once. You can also make muffins and small loaves using this recipe; bake for 30 to 35 minutes.',
  ingredients: '3 cups canned pumpkin puree#@!1 1/2 cups vegetable oil#@!4 cups white sugar#@!6 eggs#@!4 3/4 cups all-purpose flour#@!1 1/2 teaspoons baking powder#@!1 1/2 teaspoons baking soda#@!1 1/2 teaspoons salt#@!1 1/2 teaspoons ground cinnamon#@!1 1/2 teaspoons ground nutmeg#@!1 1/2 teaspoons ground cloves',
  user_id: (1..user_count).to_a.sample,
  category_id: 1,
  prep_time: 15,
  cook_time: 60,
  steps_attributes: [{
    body: '0Preheat the oven to 350 degrees F (175 degrees C). Grease and flour three 9x5 inch loaf pans.',
    order:0
  }, {
    body: '0In a large bowl, mix together the pumpkin, oil, sugar, and eggs. Combine the flour, baking powder, baking soda, salt, cinnamon, nutmeg, and cloves; stir into the pumpkin mixture until well blended. Divide the batter evenly between the prepared pans.',
    order:1
  }, {
    body: '0Bake in preheated oven for 45 minutes to 1 hour. The top of the loaf should spring back when lightly pressed.',
    order:2
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473354304/2736259_tveeyz.jpg',
    order:3
  }
  ]
)

Comment.create!(recipe_id: 43, user_id: (1..user_count).to_a.sample, content: "Perfect!")
Comment.create!(recipe_id: 43, user_id: (1..user_count).to_a.sample, content: "Having pumpkin bread for Thanksgiving has always been a tradition in our family and we have always followed the same recipe for years until it was lost.")
Comment.create!(recipe_id: 43, user_id: (1..user_count).to_a.sample, content: "This is the best pumpkin bread! I added rum soaked raisins to the batter and I also doubled the spices which really brought out the flavor. Delicious!!!!!")
Comment.create!(recipe_id: 43, user_id: (1..user_count).to_a.sample, content: "yummy")
Comment.create!(recipe_id: 43, user_id: (1..user_count).to_a.sample, content: "I made this recipe and gave away 4 loaves. Every person I gave a loaf to raved about how good it was and wanted the recipe.")
Comment.create!(recipe_id: 43, user_id: (1..user_count).to_a.sample, content: "Great bread recipe. I have now made four loaves. One of my loaves was a bit undercooked and had the effect of pumpkin pie in the middle. It was actually very good.")
Comment.create!(recipe_id: 43, user_id: (1..user_count).to_a.sample, content: "This is a wonderful Recipe. I have made it 3 times in two weeks for family, friends, a party and my sons school. As soon as the first batch was gone I was begged to make more.")
Comment.create!(recipe_id: 43, user_id: (1..user_count).to_a.sample, content: "This is similar to a recipe from the Joy of Cooking that I have misplaced. It was delicious and moist. I used pumpkin pie spice instead of the cinnamon, etc.")


# http://allrecipes.com/recipe/14231/guacamole/?internalSource=hub%20recipe&referringId=76&referringContentType=recipe%20hub&clickId=cardslot%2012

Recipe.create!(
  title: 'Guacamole',
  description: 'You can make this avocado salad smooth or chunky depending on your tastes.',
  ingredients: '3 avocados - peeled, pitted, and mashed#@!1 lime, juiced#@!1 teaspoon salt#@!1/2 cup diced onion#@!3 tablespoons chopped fresh cilantro#@!2 roma (plum) tomatoes, diced#@!1 teaspoon minced garlic#@!1 pinch ground cayenne pepper (optional)',
  user_id: (1..user_count).to_a.sample,
  category_id: 2,
  prep_time: 10,
  cook_time: 10,
  steps_attributes: [{
    body: '0In a medium bowl, mash together the avocados, lime juice, and salt. Mix in onion, cilantro, tomatoes, and garlic. Stir in cayenne pepper. Refrigerate 1 hour for best flavor, or serve immediately.',
    order:0
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473355834/811729_sldvi1.jpg',
    order:1
  }
  ]
)

Comment.create!(recipe_id: 44, user_id: (1..user_count).to_a.sample, content: "Yum! This was my first attempt at making gauc and I was not let down by the high rating on this recipe.")
Comment.create!(recipe_id: 44, user_id: (1..user_count).to_a.sample, content: "This was the first time I made guacamole and it turned out great. Even had enough to take to work and share with my co-workers. Everyone who tried it thought it was fantastic.")
Comment.create!(recipe_id: 44, user_id: (1..user_count).to_a.sample, content: "Moving from the deep South (US) to Canada, I truly miss my Tex-Mex food. This is a great recipe and I use it often!")
Comment.create!(recipe_id: 44, user_id: (1..user_count).to_a.sample, content: "This is another great Guacamole recipie! This has a wonderful combination of flavors! The cayenne, cilantro, and garlic work wonders for dressing up Guac!")
Comment.create!(recipe_id: 44, user_id: (1..user_count).to_a.sample, content: "Now THIS is excellent guacamole!")
Comment.create!(recipe_id: 44, user_id: (1..user_count).to_a.sample, content: "Yummy! I liked the fact that this didn't have sour cream, mayo, or cream cheese added. Who really wants added fat in your guacamole if it is fabulous without!")
Comment.create!(recipe_id: 44, user_id: (1..user_count).to_a.sample, content: "This is the first time I made guacamole, and it turned out very well.")
Comment.create!(recipe_id: 44, user_id: (1..user_count).to_a.sample, content: "I've been making guac this way for years and I love it! I sometimes use lemon to give it a change :)")


# http://allrecipes.com/recipe/127491/easy-oreo-truffles/?internalSource=recipe%20hub&referringId=79&referringContentType=recipe%20hub&clickId=cardslot%2033
Recipe.create!(
  title: 'Easy OREO Truffles',
  description: 'These truffles are very easy and delicious. You can\'t go wrong with OREO, cream cheese and chocolate!',
  ingredients: '1 (16 ounce) package OREO Chocolate Sandwich Cookies, divided#@!1 (8 ounce) package PHILADELPHIA Cream Cheese, softened#@!2 (8 ounce) packages BAKER\'S Semi-Sweet Baking Chocolate, melted',
  user_id: (1..user_count).to_a.sample,
  category_id: 3,
  prep_time: 45,
  cook_time: 45,
  steps_attributes: [{
    body: '0Crush 9 of the cookies to fine crumbs in food processor; reserve for later use. (Cookies can also be finely crushed in a resealable plastic bag using a rolling pin.) Crush remaining 36 cookies to fine crumbs; place in medium bowl. Add cream cheese; mix until well blended. Roll cookie mixture into 42 balls, about 1-inch in diameter.',
    order:0
  }, {
    body: '0Dip balls in chocolate; place on wax paper-covered baking sheet. (Any leftover chocolate can be stored at room temperature for another use.) Sprinkle with reserved cookie crumbs.',
    order:1
  }, {
    body: '0Refrigerate until firm, about 1 hour. Store leftover truffles, covered, in refrigerator.',
    order:2
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473357105/2782077_vetpa4.jpg',
    order:3
  }
  ]
)

Comment.create!(recipe_id: 45, user_id: (1..user_count).to_a.sample, content: "crowd pleaser. everyone always begs for these but i recommend the following: 1. don't use double stuf oreos (they fall apart, it's messy, just don't try it) 2.")
Comment.create!(recipe_id: 45, user_id: (1..user_count).to_a.sample, content: "I have been making these Oreo Truffles for years, and have used all different flavors of sandwich cookies...from Nutter Butter to Coffee & Cream Oreos.")
Comment.create!(recipe_id: 45, user_id: (1..user_count).to_a.sample, content: "Good recipe - easy to follow and ingredients are non-threatening/easy to find. A word to the wise. I'm not great with baking that requires complete attention.")
Comment.create!(recipe_id: 45, user_id: (1..user_count).to_a.sample, content: "Excellent! I followed the advice to crush cookies in the processor AND then add the cream cheese via the same way.")
Comment.create!(recipe_id: 45, user_id: (1..user_count).to_a.sample, content: "I got this recipe for \"Oreo Balls\" at my cooking club cookie exchange last year and have had HUGE success with them.")
Comment.create!(recipe_id: 45, user_id: (1..user_count).to_a.sample, content: "Love these!!! They were the hit of Christmas!!! All gone at the end of the day and everyone wanted the recipe!")
Comment.create!(recipe_id: 45, user_id: (1..user_count).to_a.sample, content: "Oh,MY, absolutely yum-o-licious! and sooo easy to make, definately put in fridge for an hour before dipping.")
Comment.create!(recipe_id: 45, user_id: (1..user_count).to_a.sample, content: "These guys are awsome, and great for x-mas gifts.")


# http://allrecipes.com/recipe/26317/chicken-pot-pie-ix/?internalSource=hub%20recipe&referringId=92&referringContentType=recipe%20hub&clickId=cardslot%206
Recipe.create!(
  title: 'Chicken Pot Pie',
  description: 'A delicious chicken pie made from scratch with carrots, peas and celery.',
  ingredients: '1 pound skinless, boneless chicken breast halves - cubed#@!1 cup sliced carrots#@!1 cup frozen green peas#@!1/2 cup sliced celery#@!1/3 cup butter#@!1/3 cup chopped onion#@!1/3 cup all-purpose flour#@!1/2 teaspoon salt#@!1/4 teaspoon black pepper#@!1/4 teaspoon celery seed#@!1 3/4 cups chicken broth#@!2/3 cup milk#@!2 (9 inch) unbaked pie crusts',
  user_id: (1..user_count).to_a.sample,
  category_id: 5,
  prep_time: 20,
  cook_time: 50,
  steps_attributes: [{
    body: '0Preheat oven to 425 degrees F (220 degrees C.)',
    order:0
  }, {
    body: '0In a saucepan, combine chicken, carrots, peas, and celery. Add water to cover and boil for 15 minutes. Remove from heat, drain and set aside.',
    order:1
  }, {
    body: '0In the saucepan over medium heat, cook onions in butter until soft and translucent. Stir in flour, salt, pepper, and celery seed. Slowly stir in chicken broth and milk. Simmer over medium-low heat until thick. Remove from heat and set aside.',
    order:2
  }, {
    body: '0Place the chicken mixture in bottom pie crust. Pour hot liquid mixture over. Cover with top crust, seal edges, and cut away excess dough. Make several small slits in the top to allow steam to escape.',
    order:3
  }, {
    body: '0Bake in the preheated oven for 30 to 35 minutes, or until pastry is golden brown and filling is bubbly. Cool for 10 minutes before serving.',
    order:4
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473358209/3838827_otlaff.jpg',
    order:5
  }
  ]
)

Comment.create!(recipe_id: 46, user_id: (1..user_count).to_a.sample, content: "The first time I made this I followed the recipe to the letter and thought it tasted great but was too dry. So I doubled the sauce.")
Comment.create!(recipe_id: 46, user_id: (1..user_count).to_a.sample, content: "This was SO delicious, the best I have ever tasted. I made it with the \"Butter Flaky Pie Crust\" and it turned out perfectly flaky and wonderful.")
Comment.create!(recipe_id: 46, user_id: (1..user_count).to_a.sample, content: "I am not a \"pot pie\" fan but made this for my guy yesterday. Took the advice of others and used a rotisserie chicken, added poultry seasoning and garlic powder, etc.")
Comment.create!(recipe_id: 46, user_id: (1..user_count).to_a.sample, content: "This was AMAZING! My family kept raving how good it was. Like others before me, I boiled the veggies and the chicken in the chicken broth.")
Comment.create!(recipe_id: 46, user_id: (1..user_count).to_a.sample, content: "This recipe was wonderful! It definately puts the frozen pot pies to shame. I only did one thing differently after reading others reviews saying that the bottom crust was soggy.")
Comment.create!(recipe_id: 46, user_id: (1..user_count).to_a.sample, content: "Yumm!")


# http://allrecipes.com/recipe/9111/cranberry-sauce/?internalSource=recipe%20hub&referringId=87&referringContentType=recipe%20hub&clickId=cardslot%2025
Recipe.create!(
  title: 'Cranberry Sauce',
  description: 'A Thanksgiving classic. Originally submitted to ThanksgivingRecipe.com.',
  ingredients: '12 ounces cranberries#@!1 cup white sugar#@!1 cup orange juice',
  user_id: (1..user_count).to_a.sample,
  category_id: 4,
  prep_time: 10,
  cook_time: 10,
  steps_attributes: [{
    body: '0In a medium sized saucepan over medium heat, dissolve the sugar in the orange juice. Stir in the cranberries and cook until the cranberries start to pop (about 10 minutes). Remove from heat and place sauce in a bowl. Cranberry sauce will thicken as it cools.',
    order:0
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473358825/743657_prxkbm.jpg',
    order:1
  }
  ]
)

Comment.create!(recipe_id: 47, user_id: (1..user_count).to_a.sample, content: "Mmmmm this is the best cranberry sauce! I LOVE it, so simple, so good!")
Comment.create!(recipe_id: 47, user_id: (1..user_count).to_a.sample, content: "I've been using this recipe for years. It is so simple and so yummy! Thanks!")
Comment.create!(recipe_id: 47, user_id: (1..user_count).to_a.sample, content: "I have been making this recipe for years-always a favorite at every Thanksgiving dinner. It's really best tasting if you use fresh orange juice!")
Comment.create!(recipe_id: 47, user_id: (1..user_count).to_a.sample, content: "This recipe was really tasty! I cooked it until most of the cranberries popped, and mashed it up a bit and left them in, and it was fantastic! Thank you :)")
Comment.create!(recipe_id: 47, user_id: (1..user_count).to_a.sample, content: "I made this for Thanksgiving, it turned out GREAT!")
Comment.create!(recipe_id: 47, user_id: (1..user_count).to_a.sample, content: "This cranberry sauce was fantastic. When cooked the cranberry sauce had a beautiful bright color. It was a perfect addition to the dinner table, and it was very quick and simple to make.")
Comment.create!(recipe_id: 47, user_id: (1..user_count).to_a.sample, content: 'At Thanksgiving, my 70 year old father said this was "just like mom used to make". It doesn\'t get any better than that!')
Comment.create!(recipe_id: 47, user_id: (1..user_count).to_a.sample, content: "I made this recipe this Thanksgiving, but changed it slightly. I added about 1 tsp grated orange rind and after the berrys were cooked down I added about 1/8 cup of Grand Marinier.")
Comment.create!(recipe_id: 47, user_id: (1..user_count).to_a.sample, content: "AWESOME!!")

# http://allrecipes.com/recipe/39455/marinated-tuna-steak/?internalSource=recipe%20hub&referringId=93&referringContentType=recipe%20hub&clickId=cardslot%2041
Recipe.create!(
  title: 'Marinated Tuna Steak',
  description: 'This mixture of orange juice, soy sauce, and garlic gives this marinade a wonderful taste.',
  ingredients: '1/4 cup orange juice#@!1/4 cup soy sauce#@!2 tablespoons olive oil#@!1 tablespoon lemon juice#@!2 tablespoons chopped fresh parsley#@!1 clove garlic, minced#@!1/2 teaspoon chopped fresh oregano#@!1/2 teaspoon ground black pepper#@!4 (4 ounce) tuna steaks',
  user_id: (1..user_count).to_a.sample,
  category_id: 6,
  prep_time: 10,
  cook_time: 11,
  steps_attributes: [{
    body: '0In a large non-reactive dish, mix together the orange juice, soy sauce, olive oil, lemon juice, parsley, garlic, oregano, and pepper. Place the tuna steaks in the marinade and turn to coat. Cover, and refrigerate for at least 30 minutes.',
    order:0
  }, {
    body: '0Preheat grill for high heat.',
    order:1
  }, {
    body: '0Lightly oil grill grate. Cook the tuna steaks for 5 to 6 minutes, then turn and baste with the marinade. Cook for an additional 5 minutes, or to desired doneness. Discard any remaining marinade.',
    order:2
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473358324/1682730_qtv34y.jpg',
    order:3
  }
  ]
)

Comment.create!(recipe_id: 48, user_id: (1..user_count).to_a.sample, content: "WOW!!! This tuna steak was insanely good. I followed the recipe exactly, except I pan seared the tuna for 3 minutes on each side instead of grilling it.")
Comment.create!(recipe_id: 48, user_id: (1..user_count).to_a.sample, content: "I consider myself a pretty proficient cook. I have created many of my own recipes and have often been told that I should have been a cook! But I have never tried tuna steak until now. It was amazing.")
Comment.create!(recipe_id: 48, user_id: (1..user_count).to_a.sample, content: "Five stars, no question. Flavorful, juicy, piquant. I quartered the recipe (just cooking for me), cooked it in a skillet and just dumped the whole mix in.")
Comment.create!(recipe_id: 48, user_id: (1..user_count).to_a.sample, content: "awesome! i followed the recipe - excpet for the following: replaced the soy sauce with Dales seasoning for meat and fish (its' soy based but as added flavor.)")
Comment.create!(recipe_id: 48, user_id: (1..user_count).to_a.sample, content: "This was excellent my husband and I could eat this every week and probably have since finding it. I add a bit more garlic but it is always wonderful! Thank you for the recipe.")
Comment.create!(recipe_id: 48, user_id: (1..user_count).to_a.sample, content: "Excellent Marinade, makes tuna very flavorful.")
Comment.create!(recipe_id: 48, user_id: (1..user_count).to_a.sample, content: "First time Tuna eater here. LOVED this recipe! I've heard Tuna can be very dry. This was very simple and inexpensive to make.")
Comment.create!(recipe_id: 48, user_id: (1..user_count).to_a.sample, content: "This marinade was great. Even my 4 year old daughter loved the tuna!")


# http://allrecipes.com/recipe/15057/overnight-blueberry-french-toast/?internalSource=hub%20recipe&referringId=78&referringContentType=recipe%20hub&clickId=cardslot%2034
Recipe.create!(
  title: 'Overnight Blueberry French Toast',
  description: 'This is a very unique breakfast dish. Good for any holiday breakfast or brunch, it\'s filled with the fresh taste of blueberries, and covered with a rich blueberry sauce to make it a one of a kind.',
  ingredients: '12 slices day-old bread, cut into 1-inch cubes#@!2 (8 ounce) packages cream cheese, cut into 1 inch cubes#@!1 cup fresh blueberries#@!12 eggs, beaten#@!2 cups milk#@!1 teaspoon vanilla extract#@!1/3 cup maple syrup#@!1 cup white sugar#@!2 tablespoons cornstarch#@!1 cup water#@!1 cup fresh blueberries#@!1 tablespoon butter',
  user_id: (1..user_count).to_a.sample,
  category_id: 1,
  prep_time: 15,
  cook_time: 75,
  steps_attributes: [{
    body: '0Lightly grease a 9x13 inch baking dish. Arrange half the bread cubes in the dish, and top with cream cheese cubes. Sprinkle 1 cup blueberries over the cream cheese, and top with remaining bread cubes.',
    order:0
  }, {
    body: '0In a large bowl, mix the eggs, milk, vanilla extract, and syrup. Pour over the bread cubes. Cover, and refrigerate overnight.',
    order:1
  }, {
    body: '0Remove the bread cube mixture from the refrigerator about 30 minutes before baking. Preheat the oven to 350 degrees F (175 degrees C).',
    order:2
  }, {
    body: '0Cover, and bake 30 minutes. Uncover, and continue baking 25 to 30 minutes, until center is firm and surface is lightly browned.',
    order:3
  }, {
    body: '0In a medium saucepan, mix the sugar, cornstarch, and water. Bring to a boil. Stirring constantly, cook 3 to 4 minutes. Mix in the remaining 1 cup blueberries. Reduce heat, and simmer 10 minutes, until the blueberries burst. Stir in the butter, and pour over the baked French toast.',
    order:4
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473436096/381517_tj7jhp.jpg',
    order:5
  }
  ]
)

Comment.create!(recipe_id: 49, user_id: (1..user_count).to_a.sample, content: "I served this Christmas morning, and it was delicious. I really liked that I could prepare it the night before. My parents even took the recipe home with them.")
Comment.create!(recipe_id: 49, user_id: (1..user_count).to_a.sample, content: "We were looking for something different for Christmas morning and this was a big hit with the whole family. It was sweet without being overly so. This is a keeper!")
Comment.create!(recipe_id: 49, user_id: (1..user_count).to_a.sample, content: "I used fat-free cream cheese and liquid egg substitute with success.")
Comment.create!(recipe_id: 49, user_id: (1..user_count).to_a.sample, content: "This is AWESOME...If you love French Toast..and if you LOVE Blueberries..this recipe is GREAT.. HINT..Make the sauce the night before and reheat in the morning..the flavor is SO MUCH Better!!!!")
Comment.create!(recipe_id: 49, user_id: (1..user_count).to_a.sample, content: "I have served this dish 3 times, it is terrific.")
Comment.create!(recipe_id: 49, user_id: (1..user_count).to_a.sample, content: "I made this for a Bible study brunch and it was very well recieved by all of the ladies who tried it. Since I had to go early , it was great to know it was all made except to bake.")
Comment.create!(recipe_id: 49, user_id: (1..user_count).to_a.sample, content: "I took this to an Easter brunch potluck. Received rave reviews. Everyone wanted my recipe!!Had to pay $5.00 for two bags of blueberries!!")

# http://allrecipes.com/recipe/23539/strawberry-oatmeal-breakfast-smoothie/?internalSource=recipe%20hub&referringId=78&referringContentType=recipe%20hub&clickId=cardslot%2035
Recipe.create!(
  title: 'Strawberry Oatmeal Breakfast Smoothie',
  description: 'This is a fast vegan smoothie with a deep pink color and a rich, creamy texture. VERY filling, and perfect for people in a rush in the morning. You don\'t have to give up a good breakfast when it\'s this fast to make! I use vitamin fortified soy milk.',
  ingredients: '1 cup soy milk#@!1/2 cup rolled oats#@!1 banana, broken into chunks#@!14 frozen strawberries#@!1/2 teaspoon vanilla extract#@!1 1/2 teaspoons white sugar',
  user_id: (1..user_count).to_a.sample,
  category_id: 1,
  prep_time: 5,
  cook_time: 5,
  steps_attributes: [{
    body: '0In a blender, combine soy milk, oats, banana and strawberries. Add vanilla and sugar if desired. Blend until smooth. Pour into glasses and serve.',
    order:0
  }, {
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473436638/409456_ispdzw.jpg',
    order:1
  }
  ]
)

Comment.create!(recipe_id: 50, user_id: (1..user_count).to_a.sample, content: "This was really good. I made it exactly as directed (using cows milk), but my frozen strawberries were sliced, so I just added them until it was thick.")
Comment.create!(recipe_id: 50, user_id: (1..user_count).to_a.sample, content: "Delicious! I have tried other smoothie recipes with varying degrees of success and this one really delivers! It is smooth & creamy and just the right thickness.")
Comment.create!(recipe_id: 50, user_id: (1..user_count).to_a.sample, content: "Being a chocolate lover, I didn't try this recipe as written, though it does sound good. I used chocolate soy milk instead of regular, and in place of the sugar, I used chocolate milk powder.")
Comment.create!(recipe_id: 50, user_id: (1..user_count).to_a.sample, content: "This is my new favorite smoothie!!I didn't need to add sugar or vanilla though. I just used vanilla soymilk. Very filling and easy. Try it with rasberries too.")
Comment.create!(recipe_id: 50, user_id: (1..user_count).to_a.sample, content: "I put the oats in first and ground them fine. It was great!!! Very filling and yummy.")

2500.times {
  Like.create(user_id: (1..user_count).to_a.sample, recipe_id: (1..50).to_a.sample)
}
