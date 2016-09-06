
User.delete_all

50.times do
  User.create!(
    username: Faker::Internet.user_name,
    password: 'password'
  )
end

User.create!(username: 'Guest', password: 'guestpassword')
Category.delete_all

breakfast = Category.create!(title: 'Breakfast')
appetizers = Category.create!(title: 'Appetizers')
desserts = Category.create!(title: 'Desserts')
vegetarian = Category.create!(title: 'Vegetarian')
meat = Category.create!(title: 'Meat')
seafood = Category.create!(title: 'Seafood')

seafood_img = Image.create!(url: 'http://res.cloudinary.com/wkdal720/image/upload/v1472947427/seafood_n15nbl.jpg')
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


# http://allrecipes.com/recipe/76278/orange-pecan-french-toast/?internalSource=staff%20pick&referringId=78&referringContentType=recipe%20hub&clickId=cardslot%202
Recipe.create!(
  title: 'Orange Pecan French Toast',
  description: 'My husband and I were vacationing recently and had this lovely French toast at a bed and breakfast. When we came back home, I kept missing it so I called them up and requested it. They actually gave me the recipe over the phone! I generally halve the recipe for my husband and I, and bake it in an 8 inch square pan. Reheats well in the toaster oven. I served it to my in-laws recently and they loved it. Serve with a little sweetened whipped cream and berries!',
  ingredients: '1 cup packed brown sugar#@!1/3 cup butter- melted#@!2 tablespoons corn syrup#@!1/3 cup chopped pecans#@!12 (3/4 inch thick) slices French bread#@!1 teaspoon grated orange zest#@!1 cup fresh orange juice#@!1/2 cup 2% milk#@!3 tablespoons white sugar#@!1 teaspoon ground cinnamon#@!1 teaspoon vanilla extract#@!3 egg whites#@!2 eggs#@!1 tablespoon confectioners\' sugar for dusting',
  user_id: (1..50).to_a.sample,
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

Comment.create!(recipe_id: 1, user_id: (1..50).to_a.sample, content: "This is a great variation to your breakfast menu. I prepared the night before and then baked in the morning. It would go great with a cream cheese frosting!")
Comment.create!(recipe_id: 1, user_id: (1..50).to_a.sample, content: "This recipe is phenomenal. One tip is to either use stale bread or crisp it up in the oven before hand. My family adores it!")
Comment.create!(recipe_id: 1, user_id: (1..50).to_a.sample, content: "AMAZING! Would make again in a heartbeat, no modifications needed to the recipe in my opinion!")
Comment.create!(recipe_id: 1, user_id: (1..50).to_a.sample, content: "I made this for Christmas brunch. Everyone loved it! Almost all went back for seconds. I enjoyed a slice that was left over the next day. Definitely will make again.")
Comment.create!(recipe_id: 1, user_id: (1..50).to_a.sample, content: "very easy, very very yummy! I make it for breakfast for dinner once a month!")
Comment.create!(recipe_id: 1, user_id: (1..50).to_a.sample, content: "It was a hit at our brunch. I might tweak it and use a little less sugar, but otherwise it was perfect.")
Comment.create!(recipe_id: 1, user_id: (1..50).to_a.sample, content: "Delicious! I used Italian bread for bigger slices, and served with raspberries and whipped cream.")
Comment.create!(recipe_id: 1, user_id: (1..50).to_a.sample, content: "I cut the sugar in half and it was still deliciously sweet. I thought it was just right! yummy!")
Comment.create!(recipe_id: 1, user_id: (1..50).to_a.sample, content: "This recipe is amazing! The neat thing about it is that you can make it ahead of time (like overnight) and it still tastes great!")

# http://allrecipes.com/recipe/17681/belgian-waffles/?internalSource=staff%20pick&referringId=78&referringContentType=recipe%20hub&clickId=cardslot%205
Recipe.create!(
  title: 'Belgian Waffles',
  description: 'Belgian waffles are tender and flavorful waffles made with yeast. They\'re great topped with butter, whipped cream and fresh fruit.',
  ingredients: '1 (.25 ounce) package active dry yeast#@!1/4 cup warm milk (110 degrees F/45 degrees C)#@!3 egg yolks#@!2 3/4 cups warm milk (110 degrees F/45 degrees C)#@!3/4 cup butter, melted and cooled to lukewarm#@!1/2 cup white sugar#@!1 1/2 teaspoons salt#@!2 teaspoons vanilla extract#@!4 cups all-purpose flour#@!3 egg whites',
  user_id: (1..50).to_a.sample,
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

Comment.create!(recipe_id: 2, user_id: (1..50).to_a.sample, content: "Make the night before.....they turn out perfectly.")
Comment.create!(recipe_id: 2, user_id: (1..50).to_a.sample, content: "I loved this recipe! True belgian waffles are a yeast batter, and this one is very genuine. My only gripe is that it makes a lot of dishes (yeast, butter, milk, mixing bowl, egg whites).")
Comment.create!(recipe_id: 2, user_id: (1..50).to_a.sample, content: "FINALLY a recipe worthy of a five star rating! I have made these waffles several times. For time purposes, I prefer preparing the batter the night before versus the morning of. ")
Comment.create!(recipe_id: 2, user_id: (1..50).to_a.sample, content: "I made these delicious waffles for our woman's retreat breakfast at church, and those women loved them.")
Comment.create!(recipe_id: 2, user_id: (1..50).to_a.sample, content: "These are good when you first make them, but if you leave the batter in the fridge overnight and then make them they are DIVINE. Such a difference in taste. It's amazing!")
Comment.create!(recipe_id: 2, user_id: (1..50).to_a.sample, content: "These were awesome! One waffle is so filling! I made this the night before and did a cold rise in the fridge. I would definitely recommend this unless you have time to wait.")
Comment.create!(recipe_id: 2, user_id: (1..50).to_a.sample, content: "This is EXACTLY the type of waffle I was looking for! Light and fluffy, yet lightly crispy on the outside. Soooo yummy!")
Comment.create!(recipe_id: 2, user_id: (1..50).to_a.sample, content: "This was my first attempt at Belgian Waffles and the recipe looked pretty simple in case I wasn't very awake in the morning. :) I made them as directed and they were a hit.")
Comment.create!(recipe_id: 2, user_id: (1..50).to_a.sample, content: "I followed the recipe to the letter except that I made it the night before and let it rise in the fridge. These waffles are awesome!")


# http://allrecipes.com/recipe/21014/good-old-fashioned-pancakes/?internalSource=hub%20recipe&referringId=151&referringContentType=recipe%20hub&clickId=cardslot%2013
Recipe.create!(
  title: 'Good Old Fashioned Pancakes',
  description: 'This is a great recipe that I found in my Grandma\'s recipe book. Judging from the weathered look of this recipe card, this was a family favorite.',
  ingredients: '1 1/2 cups all-purpose flour#@!3 1/2 teaspoons baking powder#@!1 teaspoon salt#@!1 tablespoon white sugar#@!1 1/4 cups milk#@!1 egg#@!3 tablespoons melted butter',
  user_id: (1..50).to_a.sample,
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

Comment.create!(recipe_id: 3, user_id: (1..50).to_a.sample, content: "Like most of the others I only used 3/4 tsp. salt and added 1 tsp. vanilla. These are the best pancakes I've ever made at home, thanks for the recipe!!")
Comment.create!(recipe_id: 3, user_id: (1..50).to_a.sample, content: "This had WAY too much salt! Next time I will only use 1/4 - 1/2 tsp. at most!")
Comment.create!(recipe_id: 3, user_id: (1..50).to_a.sample, content: "These are great and easy. A lot better than the ones from a box. I will continue to make them for sure. They were light and fluffy with a good taste.")
Comment.create!(recipe_id: 3, user_id: (1..50).to_a.sample, content: "Judging by the other comments, it seems we may have done something wrong because we couldn't even bring ourselves to eat these. The aftertaste was horrible. Too much baking powder?")
Comment.create!(recipe_id: 3, user_id: (1..50).to_a.sample, content: "These are amazing made exactly as the recipe calls. I added 1tsp vanilla and chocolate chips and they turned out fantastic!")
Comment.create!(recipe_id: 3, user_id: (1..50).to_a.sample, content: "I don't understand why people make variations to a recipe and then give it a poor rating after they've ruined it. It is unfair to the poster. ")
Comment.create!(recipe_id: 3, user_id: (1..50).to_a.sample, content: "These pancakes are awesome. Literally the best pancakes I have ever eaten. I make extra because even without syrup, they are yummy to nibble on later. ")
Comment.create!(recipe_id: 3, user_id: (1..50).to_a.sample, content: "Good basic recipe with the exception of the consistency. If you follow this recipe to the letter the batter is much to thick and you'll end up with 2\" thick cakes.")
Comment.create!(recipe_id: 3, user_id: (1..50).to_a.sample, content: "These are simply delicious. Quick and easy to make. Left overs store well n the frig. I am single. I make the whole recipe and am good for the week.")




# http://allrecipes.com/recipe/20156/clone-of-a-cinnabon/?internalSource=staff%20pick&referringId=78&referringContentType=recipe%20hub&clickId=cardslot%208
Recipe.create!(
  title: 'Clone of a Cinnabon',
  description: 'You have got to try these. The first time I made them, I thought of how much money I could save by making my own!',
  ingredients: '1 cup warm milk (110 degrees F/45 degrees C)#@!2 eggs, room temperature#@!1/3 cup margarine, melted#@!4 1/2 cups bread flour#@!1 teaspoon salt#@!1/2 cup white sugar#@!2 1/2 teaspoons bread machine yeast#@!2 1/2 teaspoons bread machine yeast#@!2 1/2 tablespoons ground cinnamon#@!1/3 cup butter, softened#@!1 (3 ounce) package cream cheese, softened#@!1 1/2 cups confectioners\' sugar#@!1/2 teaspoon vanilla extract#@!1/8 teaspoon salt',
  user_id: (1..50).to_a.sample,
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
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473106985/cinnamon_x9dyno.jpg',
    order: 5
    }
  ]
)
Comment.create!(recipe_id: 4, user_id: (1..50).to_a.sample, content: "I made these for a girls only brunch & they were gobbled up!! Fabulous!")
Comment.create!(recipe_id: 4, user_id: (1..50).to_a.sample, content: "I made these for a girls only brunch & they were gobbled up!! Fabulous!")
Comment.create!(recipe_id: 4, user_id: (1..50).to_a.sample, content: "These are wonderfull! Not difficult to make and they are YUMMY. Highly reccomend this recipe. I would like to know if these are okay to refigerate overnight before placing in the oven.")
Comment.create!(recipe_id: 4, user_id: (1..50).to_a.sample, content: "This really does taste like a cinnabon. I thought that they were great and my husband even likes them!")
Comment.create!(recipe_id: 4, user_id: (1..50).to_a.sample, content: "Scrumptious!! I doubled the frosting recipe :)")
Comment.create!(recipe_id: 4, user_id: (1..50).to_a.sample, content: "I had no idea I could make something so good! The bread machine really makes this easy and they are delicious. Marsha, thanks for sharing such a great recipe.")
Comment.create!(recipe_id: 4, user_id: (1..50).to_a.sample, content: "This recipe is fabulous. Will definately make again!")



# http://allrecipes.com/recipe/235095/easy-rumaki-with-pineapple/?internalSource=staff%20pick&referringId=76&referringContentType=recipe%20hub&clickId=cardslot%202
Recipe.create!(
  title: 'Easy Rumaki with Pineapple',
  description: 'This combines the crunchiness of bacon and water chestnuts with the wonderful flavors of pineapple. We make it right before watching football games, but it doesn\'t last long.',
  ingredients: 'cooking spray#@!24 (1 inch) cubes fresh pineapple#@!24 water chestnut slices#@!8 thick-cut bacon slices, cut crosswise into 3 pieces#@!24 toothpicks#@!1/2 cup low-fat sesame-ginger salad dressing#@!1 tablespoon chopped green onion, or to taste',
  user_id: (1..50).to_a.sample,
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
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473107469/1291543_mppc0r.jpg',
    order: 3
  }
  ]
)

Comment.create!(recipe_id: 5, user_id: (1..50).to_a.sample, content: "Wonderful! Made a batch of these for Sunday NFL day for hubby and they were a hit!")
Comment.create!(recipe_id: 5, user_id: (1..50).to_a.sample, content: "I don't like pineapple or water chestnuts but these were delicious!")
Comment.create!(recipe_id: 5, user_id: (1..50).to_a.sample, content: "This was a hit, I will make it again.")
Comment.create!(recipe_id: 5, user_id: (1..50).to_a.sample, content: "YUMMY! Big hit at guys ice fishin' weekend! I agree with the 1st reviewer that an oven at 425 worked well. I like my bacon crispy, so it seemed the higher temp worked better.")
Comment.create!(recipe_id: 5, user_id: (1..50).to_a.sample, content: "These are not just for appetizers and snacks. The 2 of us had them for dinner, no left overs. I fixed some rice with teriyaki sauce and chicken broth to go with them.")
Comment.create!(recipe_id: 5, user_id: (1..50).to_a.sample, content: "These flavors together is magical. Agree that 425° is better. I think I'll use the grill next time for more even crispness.")
Comment.create!(recipe_id: 5, user_id: (1..50).to_a.sample, content: "I increased the temp to 425 as others suggested, but I made one mistake. I used thin sliced bacon thinking they would crisp up faster, but some of them fell apart!")


# http://allrecipes.com/recipe/216909/stuffed-jalapeno-firecrackers/?internalSource=hn_carousel%2002_Stuffed%20Jalapeno%20Firecrackers&referringId=76&referringContentType=recipe%20hub&referringPosition=carousel%2002
Recipe.create!(
  title: 'Stuffed Jalapeno Firecrackers',
  description: 'This recipe came about after years of competition with family and friends over the perfect stuffed jalapeno. Bring your tissues because these are HOT! Goes well with Summer Beer I from this site.',
  ingredients: '12 jalapeno peppers, halved lengthwise#@!1 (8 ounce) package cream cheese, softened#@!Cajun seasoning, or to taste#@!12 slices jalapeno bacon, cut in half#@!toothpicks',
  user_id: (1..50).to_a.sample,
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

Comment.create!(recipe_id: 6, user_id: (1..50).to_a.sample, content: "Here in Texas it seems every store has the jalapeno bacon. If you cannot find it at your local grocer you can purchase the bacon online")
Comment.create!(recipe_id: 6, user_id: (1..50).to_a.sample, content: "I've made these for years. Everytime I make them they are the first app to go. I haven't tried with the cajun seasoning but will next time.")
Comment.create!(recipe_id: 6, user_id: (1..50).to_a.sample, content: "Fantastic twist to the usual jalapeno popper. After reading reviews I pulled it off like this: Did all the recommended prep plus baked the jalapenos for 15 minutes at 350 to lessen the heat.")
Comment.create!(recipe_id: 6, user_id: (1..50).to_a.sample, content: "hese are fantastic!! I also added some chopped pineapple and garlic powder to the cream cheese. Everyone loved them! Also added a sprinkle of brown sugar over the bacon for extra yum.")
Comment.create!(recipe_id: 6, user_id: (1..50).to_a.sample, content: "OK, rule of thumb, the smaller the Jalapeno, the hotter it is. Use gloves to seed the peppers, else you get the oils on your hands and hurt for some time.")
Comment.create!(recipe_id: 6, user_id: (1..50).to_a.sample, content: "My family loves this. I find is faster to just lay and push the bacon into the cream cheese a little to make it stick on top, that way the bacon is crisp all over.")



# http://allrecipes.com/recipe/15184/mouth-watering-stuffed-mushrooms/?internalSource=staff%20pick&referringId=76&referringContentType=recipe%20hub&clickId=cardslot%203
Recipe.create!(
  title: 'Mouth-Watering Stuffed Mushrooms',
  description: 'These delicious mushrooms taste just like restaurant-style stuffed mushrooms and are my guy\'s absolute favorite.',
  ingredients: '12 whole fresh mushrooms#@!1 tablespoon vegetable oil#@!1 tablespoon minced garlic#@!1 (8 ounce) package cream cheese, softened#@!1/4 cup grated Parmesan cheese#@!1/4 teaspoon ground black pepper#@!1/4 teaspoon onion powder#@!1/4 teaspoon ground cayenne pepper',
  user_id: (1..50).to_a.sample,
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

Comment.create!(recipe_id: 7, user_id: (1..50).to_a.sample, content: "I've made these many times and everyone loves them. They are not time consuming at all and can be made up two days before needed.")
Comment.create!(recipe_id: 7, user_id: (1..50).to_a.sample, content: "This is a favorite recipe that I have made several times and I never have any leftovers. Even my young son loves the flavorfull filling.")
Comment.create!(recipe_id: 7, user_id: (1..50).to_a.sample, content: "Great! A little time consuming, but worth it.")
Comment.create!(recipe_id: 7, user_id: (1..50).to_a.sample, content: "Wow, these are ever so good exactly as written!!!")
Comment.create!(recipe_id: 7, user_id: (1..50).to_a.sample, content: "This was my first time making stuffed mushrooms and after reading several of the reviews I decided on how I would make mine.")
Comment.create!(recipe_id: 7, user_id: (1..50).to_a.sample, content: "I made for Christmas dinner appetizer and they were YUMMY! But i also read a lot of the reviews and took some of the advice (and left some).")
Comment.create!(recipe_id: 7, user_id: (1..50).to_a.sample, content: "Excellent recipe. I doubled the filling and used 24 oz fresh mushrooms and it filled them almost perfectly.")
Comment.create!(recipe_id: 7, user_id: (1..50).to_a.sample, content: "I have made these many times, and they always disappear so fast! What a great recipe.")


# http://allrecipes.com/recipe/212896/caprese-appetizer/?internalSource=hub%20recipe&referringContentType=search%20results&clickId=cardslot%203
Recipe.create!(
  title: 'Caprese Appetizer',
  description: 'Caprese salad skewers. Perfect for holiday parties.',
  ingredients: '20 grape tomatoes#@!10 ounces mozzarella cheese, cubed#@!2 tablespoons extra virgin olive oil#@!2 tablespoons fresh basil leaves, chopped#@!1 pinch salt#@!1 pinch ground black pepper#@!20 toothpicks',
  user_id: (1..50).to_a.sample,
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

Comment.create!(recipe_id: 8, user_id: (1..50).to_a.sample, content: "Delicious! I bought boconccini (little fresh mozzarella balls) and I marinated them for 2 days in garlic powder, dried basil and oregano and salt and pepper.")
Comment.create!(recipe_id: 8, user_id: (1..50).to_a.sample, content: "I haven't made this exact recipe but one similar. I find it's easier to eat if you halve the grape tomatoes and put the cubed cheese with the half piece.")
Comment.create!(recipe_id: 8, user_id: (1..50).to_a.sample, content: "This is one of my favorite things to eat, but I had a little balsamic vinegar to the mixture. Gives it just the right amount of kick!")
Comment.create!(recipe_id: 8, user_id: (1..50).to_a.sample, content: "This was very good! I skewered half a grape tomato, a piece of fresh mozzarella cheese, a piece of basil and then the second half of the tomato.")
Comment.create!(recipe_id: 8, user_id: (1..50).to_a.sample, content: "I buy the mozzarella balls that are in a herbed oil in the specialty cheese case of my grocery store. Make the skewers & pour the oil over them.")
Comment.create!(recipe_id: 8, user_id: (1..50).to_a.sample, content: "My sister-in-law made these for Christmas. Instead of chopping the basil she threaded a leaf between the cheese and tomato.")
Comment.create!(recipe_id: 8, user_id: (1..50).to_a.sample, content: "These have been the highlight of my summer! I've taken them to parties and love them the next day for lunch or with a sandwich or salad.")









# TODO

# http://allrecipes.com/recipe/237116/waldorfs-sour-cream-cheesecake/?internalSource=hn_carousel%2002_Waldorf%27s%20Sour%20Cream%20Cheesecake&referringId=79&referringContentType=recipe%20hub&referringPosition=carousel%2002
Recipe.create!(
  title: 'Waldorf\'s Sour Cream Cheesecake',
  description: 'A wonderful and easy cheesecake recipe my mother-in-law made for the holidays and special occasions.',
  ingredients: '7 ounces vanilla wafers, crushed#@! 1/2 cup margarine, melted#@!2 tablespoons white sugar#@!1 pinch ground cinnamon#@!2 (8 ounce) packages cream cheese, softened#@!1 cup white sugar#@!2 tablespoons lemon juice#@!4 eggs#@!1 pint sour cream#@!2 tablespoons white sugar#@!1 teaspoon vanilla extract',
  user_id: (1..50).to_a.sample,
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
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473108941/1401385_anvntw.jpg',
    order:9
  }
  ]
)

# Comment.create!(recipe_id: 9, user_id: (1..50).to_a.sample, content: "")

# http://allrecipes.com/recipe/25037/best-big-fat-chewy-chocolate-chip-cookie/?internalSource=hub%20recipe&referringId=79&referringContentType=recipe%20hub&clickId=cardslot%2014
Recipe.create!(
  title: 'Best Big, Fat, Chewy Chocolate Chip Cookie',
  description: 'These cookies are the pinnacle of perfection! If you want a big, fat, chewy cookie like the kind you see at bakeries and specialty shops, then these are the cookies for you!',
  ingredients: '2 cups all-purpose flour#@!1/2 teaspoon baking soda#@!1/2 teaspoon salt#@!3/4 cup unsalted butter, melted#@!1 cup packed brown sugar#@!1/2 cup white sugar#@!1 tablespoon vanilla extract 1 egg#@!1 egg yolk#@!2 cups semisweet chocolate chips',
  user_id: (1..50).to_a.sample,
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

# http://allrecipes.com/recipe/10549/best-brownies/?internalSource=hub%20recipe&referringId=79&referringContentType=recipe%20hub&clickId=cardslot%2018
Recipe.create!(
  title: 'Best Brownies',
  description: 'These brownies always turn out!',
  ingredients: '1/2 cup butter#@!1 cup white sugar#@!2 eggs#@!1 teaspoon vanilla extract#@!1/3 cup unsweetened cocoa powder#@!1/2 cup all-purpose flour#@!1/4 teaspoon salt#@!1/4 teaspoon baking powder#@!3 tablespoons butter, softened#@!3 tablespoons unsweetened cocoa powder#@!1 tablespoon honey#@!1 teaspoon vanilla extract#@!1 cup confectioners\' sugar',
  user_id: (1..50).to_a.sample,
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

# http://allrecipes.com/recipe/223016/fresh-blueberry-cake/?internalSource=staff%20pick&referringId=79&referringContentType=recipe%20hub&clickId=cardslot%208
Recipe.create!(
  title: 'Fresh Blueberry Cake',
  description: 'This is a DELICIOUS blueberry cake made with fresh blueberries! It is great with confectioners sugar or whipped cream on top!',
  ingredients: '2 cups all-purpose flour#@!2 teaspoons baking powder#@!1 cup white sugar#@!1/4 teaspoon salt#@!1/3 cup shortening#@!3/4 cup milk#@!1 egg#@!1 teaspoon lemon zest#@!1 cup blueberries',
  user_id: (1..50).to_a.sample,
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


# http://allrecipes.com/recipe/59661/spinach-enchiladas/?internalSource=hn_carousel%2001_Spinach%20Enchiladas&referringId=87&referringContentType=recipe%20hub&referringPosition=carousel%2001
Recipe.create!(
  title: 'Spinach Enchiladas',
  description: 'If you like spinach and Mexican food, you\'ll love these easy vegetarian enchiladas made with ricotta cheese and spinach.',
  ingredients: '1 tablespoon butter#@!1/2 cup sliced green onions#@!2 cloves garlic, minced#@!1 (10 ounce) package frozen chopped spinach, thawed, drained and squeezed dry#@!1 cup ricotta cheese#@!1/2 cup sour cream#@!2 cups shredded Monterey Jack cheese#@!10 (6 inch) corn tortillas#@!1 (19 ounce) can enchilada sauce',
  user_id: (1..50).to_a.sample,
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
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473110125/454897_gnwqh3.jpg',
    order:4
  }
  ]
)

# http://allrecipes.com/recipe/49552/quinoa-and-black-beans/?internalSource=hub%20recipe&referringId=87&referringContentType=recipe%20hub&clickId=cardslot%2013
Recipe.create!(
  title: 'Quinoa and Black Beans',
  description: 'Very flavorful alternative to black beans and rice. Quinoa is a nutty grain from South America.',
  ingredients: '1 teaspoon vegetable oil#@!1 onion, chopped#@!3 cloves garlic, chopped#@!3/4 cup quinoa#@!1 1/2 cups vegetable broth#@!1 teaspoon ground cumin#@!1/4 teaspoon cayenne pepper#@!salt and ground black pepper to taste#@!1 cup frozen corn kernels#@!2 (15 ounce) cans black beans, rinsed and drained#@!1/2 cup chopped fresh cilantro',
  user_id: (1..50).to_a.sample,
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

# http://allrecipes.com/recipe/85452/homemade-black-bean-veggie-burgers/?internalSource=hub%20recipe&referringId=87&referringContentType=recipe%20hub&clickId=cardslot%2024
Recipe.create!(
  title: 'Homemade Black Bean Veggie Burgers',
  description: 'You will never want to eat frozen veggie burgers again. These are so easy, and you\'ll be proud to have created such a vegetarian delight.',
  ingredients: '1 (16 ounce) can black beans, drained and rinsed#@!1/2 green bell pepper, cut into 2 inch pieces#@!1/2 onion, cut into wedges#@!3 cloves garlic, peeled#@!1 egg#@!1 tablespoon chili powder#@!1 tablespoon cumin#@!1 teaspoon Thai chili sauce or hot sauce#@!1/2 cup bread crumbs',
  user_id: (1..50).to_a.sample,
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

# http://allrecipes.com/recipe/13113/rich-and-creamy-tomato-basil-soup/?internalSource=recipe%20hub&referringId=87&referringContentType=recipe%20hub&clickId=cardslot%2049
Recipe.create!(
  title: 'Rich and Creamy Tomato Basil Soup',
  description: 'The secret to the richness of this soup is to use real butter, fresh basil leaves, and heavy cream. Please do not substitute, or you will not have the same high quality end result.',
  ingredients: '4 tomatoes - peeled, seeded and diced#@!4 cups tomato juice#@!14 leaves fresh basil#@!1 cup heavy whipping cream#@!1/2 cup butter#@!salt and pepper to taste',
  user_id: (1..50).to_a.sample,
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


# http://allrecipes.com/recipe/78370/hamburger-steak-with-onions-and-gravy/?internalSource=staff%20pick&referringId=92&referringContentType=recipe%20hub&clickId=cardslot%202
Recipe.create!(
  title: 'Hamburger Steak with Onions and Gravy',
  description: 'An easy-to-make classic featuring tasty hamburger \'steaks\' smothered in gravy and onions. Traditionally served with hot white rice or potatoes, it\'s a great way to dress up a pound of ground beef and you probably have all the ingredients on hand!',
  ingredients: '1 pound ground beef#@!1 egg#@!1/4 cup bread crumbs#@!1/8 teaspoon ground black pepper#@!1/2 teaspoon seasoned salt#@!1/2 teaspoon onion powder#@!1/2 teaspoon garlic powder#@!1 teaspoon Worcestershire sauce#@!1 tablespoon vegetable oil#@!1 cup thinly sliced onion#@!2 tablespoons all-purpose flour#@!1 cup beef broth#@!1 tablespoon cooking sherry#@!1/2 teaspoon seasoned salt',
  user_id: (1..50).to_a.sample,
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
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473118331/2457809_fqd93r.jpg',
    order:5
  }
  ]
)


# http://allrecipes.com/recipe/8948/italian-chicken-marinade/?internalSource=staff%20pick&referringId=88&referringContentType=recipe%20hub&clickId=cardslot%203
Recipe.create!(
  title: 'Italian Chicken Marinade',
  description: 'This is a simple but delicious way of marinating your chicken.',
  ingredients: '1 (16 ounce) bottle Italian-style salad dressing#@!1 teaspoon garlic powder#@!1 teaspoon salt#@!4 skinless, boneless chicken breast halves',
  user_id: (1..50).to_a.sample,
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


# http://allrecipes.com/recipe/54342/chipotle-crusted-pork-tenderloin/?internalSource=staff%20pick&referringId=88&referringContentType=recipe%20hub&clickId=cardslot%206
Recipe.create!(
  title: 'Chipotle Crusted Pork Tenderloin',
  description: 'Sweet and spicy rub for pork tenderloins. Just coat, let stand for 20 minutes and grill! Goes great with polenta or mashed yams.',
  ingredients: '1 teaspoon onion powder#@!1 teaspoon garlic powder#@!3 tablespoons chipotle chile powder#@!1 1/2 teaspoons salt#@!4 tablespoons brown sugar#@!2 (3/4 pound) pork tenderloins',
  user_id: (1..50).to_a.sample,
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


# http://allrecipes.com/recipe/143809/best-steak-marinade-in-existence/?internalSource=hub%20recipe&referringId=88&referringContentType=recipe%20hub&clickId=cardslot%2018
Recipe.create!(
  title: 'Best Steak Marinade in Existence',
  description: 'This is a family recipe that has been developed only over the last 5 years. In this short time it\'s made me famous in our close circle, but until now I\'ve never shared it with anyone.',
  ingredients: '1/3 cup soy sauce#@!1/2 cup olive oil#@!1/3 cup fresh lemon juice#@!1/4 cup Worcestershire sauce#@!1 1/2 tablespoons garlic powder#@!3 tablespoons dried basil#@!1 1/2 tablespoons dried parsley flakes#@!1 teaspoon ground white pepper#@!1/4 teaspoon hot pepper sauce (optional)#@!1 teaspoon dried minced garlic (optional)',
  user_id: (1..50).to_a.sample,
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

# http://allrecipes.com/recipe/51283/maple-salmon/?internalSource=hn_carousel%2002_Maple%20Salmon&referringId=93&referringContentType=recipe%20hub&referringPosition=carousel%2002
Recipe.create!(
  title: 'Maple Salmon',
  description: 'This is the best and most delicious salmon recipe, and very easy to prepare. I love maple in everything and put this together one night. My husband totally loved it; he did not like salmon that much until he had this.',
  ingredients: '1/4 cup maple syrup#@!2 tablespoons soy sauce#@!1 clove garlic, minced#@!1/4 teaspoon garlic salt#@!1/8 teaspoon ground black pepper#@!1 pound salmon',
  user_id: (1..50).to_a.sample,
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
    body: '1http://res.cloudinary.com/wkdal720/image/upload/v1473119794/862371_jsjcdz.jpg',
    order:5
  }
  ]
)


# http://allrecipes.com/recipe/17753/coconut-shrimp-i/?internalSource=staff%20pick&referringId=93&referringContentType=recipe%20hub&clickId=cardslot%208
Recipe.create!(
  title: 'Coconut Shrimp',
  description: 'These crispy shrimp are rolled in a coconut beer batter before frying. For dipping sauce, I use orange marmalade, mustard and horseradish mixed to taste.',
  ingredients: '1 egg#@!1/2 cup all-purpose flour#@!2/3 cup beer#@!1 1/2 teaspoons baking powder#@!1/4 cup all-purpose flour#@!2 cups flaked coconut#@!24 shrimp#@!3 cups oil for frying',
  user_id: (1..50).to_a.sample,
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


# http://allrecipes.com/recipe/13041/my-best-clam-chowder/?internalSource=hub%20recipe&referringId=93&referringContentType=recipe%20hub&clickId=cardslot%2027
Recipe.create!(
  title: 'My Best Clam Chowder',
  description: 'A delicious, traditional, cream based chowder, this recipe calls for the standard chowder ingredients: onion, celery, potatoes, diced carrots, clams, and cream. A little red wine vinegar is added before serving for extra flavor.',
  ingredients: '3 (6.5 ounce) cans minced clams#@!1 cup minced onion#@!1 cup diced celery#@!2 cups cubed potatoes#@!1 cup diced carrots#@!3/4 cup butter#@!3/4 cup all-purpose flour#@!1 quart half-and-half cream#@!2 tablespoons red wine vinegar#@!1 1/2 teaspoons salt#@!ground black pepper to taste',
  user_id: (1..50).to_a.sample,
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


# http://allrecipes.com/recipe/21694/marinated-grilled-shrimp/?internalSource=hub%20recipe&referringId=93&referringContentType=recipe%20hub&clickId=cardslot%2015
Recipe.create!(
  title: 'Marinated Grilled Shrimp',
  description: 'A very simple and easy marinade that makes your shrimp so yummy you don\'t even need cocktail sauce! Don\'t let the cayenne pepper scare you, you don\'t even taste it. My 2 and 4 year-olds love it and eat more shrimp than their parents! It is also a big hit with company, and easy to prepare. I make this with frozen or fresh shrimp and use my indoor electric grill if the weather is not good for outside grilling. Try it with a salad, baked potato, and garlic bread. You will not be disappointed!!!',
  ingredients: '3 cloves garlic, minced#@!1/3 cup olive oil#@!1/4 cup tomato sauce#@!2 tablespoons red wine vinegar#@!2 tablespoons chopped fresh basil#@!1/2 teaspoon salt#@!1/4 teaspoon cayenne pepper#@!2 pounds fresh shrimp, peeled and deveined#@!skewers',
  user_id: (1..50).to_a.sample,
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

500.times {
  Like.create(user_id: (1..50).to_a.sample, recipe_id: (1..24).to_a.sample)
}


# comment form
# Comment.create!(recipe_id: , user_id: (1..50).to_a.sample, content: "")

# form for recipe create
# Recipe.create!(
#   title: ,
#   description: ,
#   ingredients: ,
#   user_id: (1..50).to_a.sample,
#   category_id: ,
#   prep_time: ,
#   cook_time: ,
#   steps_attributes: [{
#     body: ,
#     order:
#   }
#   ]
# )
