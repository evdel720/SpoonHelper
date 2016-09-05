
User.delete_all

20.times do
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
vegetarian = Category.create!(title: 'Vegetarian Dish')
meat = Category.create!(title: 'Meat Dish')
seafood = Category.create!(title: 'Seafood Dish')

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

# http://allrecipes.com/recipe/76278/orange-pecan-french-toast/?internalSource=staff%20pick&referringId=78&referringContentType=recipe%20hub&clickId=cardslot%202
Recipe.create!(
  title: 'Orange Pecan French Toast',
  description: 'My husband and I were vacationing recently and had this lovely French toast at a bed and breakfast. When we came back home, I kept missing it so I called them up and requested it. They actually gave me the recipe over the phone! I generally halve the recipe for my husband and I, and bake it in an 8 inch square pan. Reheats well in the toaster oven. I served it to my in-laws recently and they loved it. Serve with a little sweetened whipped cream and berries!',
  ingredients: '1 cup packed brown sugar#@!1/3 cup butter- melted#@!2 tablespoons corn syrup#@!1/3 cup chopped pecans#@!12 (3/4 inch thick) slices French bread#@!1 teaspoon grated orange zest#@!1 cup fresh orange juice#@!1/2 cup 2% milk#@!3 tablespoons white sugar#@!1 teaspoon ground cinnamon#@!1 teaspoon vanilla extract#@!3 egg whites#@!2 eggs#@!1 tablespoon confectioners\' sugar for dusting',
  user_id: (1..20).to_a.sample,
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

# http://allrecipes.com/recipe/17681/belgian-waffles/?internalSource=staff%20pick&referringId=78&referringContentType=recipe%20hub&clickId=cardslot%205
Recipe.create!(
  title: 'Belgian Waffles',
  description: 'Belgian waffles are tender and flavorful waffles made with yeast. They\'re great topped with butter, whipped cream and fresh fruit.',
  ingredients: '1 (.25 ounce) package active dry yeast#@!1/4 cup warm milk (110 degrees F/45 degrees C)#@!3 egg yolks#@!2 3/4 cups warm milk (110 degrees F/45 degrees C)#@!3/4 cup butter, melted and cooled to lukewarm#@!1/2 cup white sugar#@!1 1/2 teaspoons salt#@!2 teaspoons vanilla extract#@!4 cups all-purpose flour#@!3 egg whites',
  user_id: (1..20).to_a.sample,
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

# http://allrecipes.com/recipe/21014/good-old-fashioned-pancakes/?internalSource=hub%20recipe&referringId=151&referringContentType=recipe%20hub&clickId=cardslot%2013
Recipe.create!(
  title: 'Good Old Fashioned Pancakes',
  description: 'This is a great recipe that I found in my Grandma\'s recipe book. Judging from the weathered look of this recipe card, this was a family favorite.',
  ingredients: '1 1/2 cups all-purpose flour#@!3 1/2 teaspoons baking powder#@!1 teaspoon salt#@!1 tablespoon white sugar#@!1 1/4 cups milk#@!1 egg#@!3 tablespoons melted butter',
  user_id: (1..20).to_a.sample,
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

# http://allrecipes.com/recipe/20156/clone-of-a-cinnabon/?internalSource=staff%20pick&referringId=78&referringContentType=recipe%20hub&clickId=cardslot%208
Recipe.create!(
  title: 'Clone of a Cinnabon',
  description: 'You have got to try these. The first time I made them, I thought of how much money I could save by making my own!',
  ingredients: '1 cup warm milk (110 degrees F/45 degrees C)#@!2 eggs, room temperature#@!1/3 cup margarine, melted#@!4 1/2 cups bread flour#@!1 teaspoon salt#@!1/2 cup white sugar#@!2 1/2 teaspoons bread machine yeast#@!2 1/2 teaspoons bread machine yeast#@!2 1/2 tablespoons ground cinnamon#@!1/3 cup butter, softened#@!1 (3 ounce) package cream cheese, softened#@!1 1/2 cups confectioners\' sugar#@!1/2 teaspoon vanilla extract#@!1/8 teaspoon salt',
  user_id: (1..20).to_a.sample,
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

# http://allrecipes.com/recipe/235095/easy-rumaki-with-pineapple/?internalSource=staff%20pick&referringId=76&referringContentType=recipe%20hub&clickId=cardslot%202
Recipe.create!(
  title: 'Easy Rumaki with Pineapple',
  description: 'This combines the crunchiness of bacon and water chestnuts with the wonderful flavors of pineapple. We make it right before watching football games, but it doesn\'t last long.',
  ingredients: 'cooking spray#@!24 (1 inch) cubes fresh pineapple#@!24 water chestnut slices#@!8 thick-cut bacon slices, cut crosswise into 3 pieces#@!24 toothpicks#@!1/2 cup low-fat sesame-ginger salad dressing#@!1 tablespoon chopped green onion, or to taste',
  user_id: (1..20).to_a.sample,
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

# http://allrecipes.com/recipe/216909/stuffed-jalapeno-firecrackers/?internalSource=hn_carousel%2002_Stuffed%20Jalapeno%20Firecrackers&referringId=76&referringContentType=recipe%20hub&referringPosition=carousel%2002
Recipe.create!(
  title: 'Stuffed Jalapeno Firecrackers',
  description: 'This recipe came about after years of competition with family and friends over the perfect stuffed jalapeno. Bring your tissues because these are HOT! Goes well with Summer Beer I from this site.',
  ingredients: '12 jalapeno peppers, halved lengthwise#@!1 (8 ounce) package cream cheese, softened#@!Cajun seasoning, or to taste#@!12 slices jalapeno bacon, cut in half#@!toothpicks',
  user_id: (1..20).to_a.sample,
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

# http://allrecipes.com/recipe/15184/mouth-watering-stuffed-mushrooms/?internalSource=staff%20pick&referringId=76&referringContentType=recipe%20hub&clickId=cardslot%203
Recipe.create!(
  title: 'Mouth-Watering Stuffed Mushrooms',
  description: 'These delicious mushrooms taste just like restaurant-style stuffed mushrooms and are my guy\'s absolute favorite.',
  ingredients: '12 whole fresh mushrooms#@!1 tablespoon vegetable oil#@!1 tablespoon minced garlic#@!1 (8 ounce) package cream cheese, softened#@!1/4 cup grated Parmesan cheese#@!1/4 teaspoon ground black pepper#@!1/4 teaspoon onion powder#@!1/4 teaspoon ground cayenne pepper',
  user_id: (1..20).to_a.sample,
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

# http://allrecipes.com/recipe/212896/caprese-appetizer/?internalSource=hub%20recipe&referringContentType=search%20results&clickId=cardslot%203
Recipe.create!(
  title: 'Caprese Appetizer',
  description: 'Caprese salad skewers. Perfect for holiday parties.',
  ingredients: '20 grape tomatoes#@!10 ounces mozzarella cheese, cubed#@!2 tablespoons extra virgin olive oil#@!2 tablespoons fresh basil leaves, chopped#@!1 pinch salt#@!1 pinch ground black pepper#@!20 toothpicks',
  user_id: (1..20).to_a.sample,
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

# http://allrecipes.com/recipe/237116/waldorfs-sour-cream-cheesecake/?internalSource=hn_carousel%2002_Waldorf%27s%20Sour%20Cream%20Cheesecake&referringId=79&referringContentType=recipe%20hub&referringPosition=carousel%2002
Recipe.create!(
  title: 'Waldorf\'s Sour Cream Cheesecake',
  description: 'A wonderful and easy cheesecake recipe my mother-in-law made for the holidays and special occasions.',
  ingredients: '7 ounces vanilla wafers, crushed#@! 1/2 cup margarine, melted#@!2 tablespoons white sugar#@!1 pinch ground cinnamon#@!2 (8 ounce) packages cream cheese, softened#@!1 cup white sugar#@!2 tablespoons lemon juice#@!4 eggs#@!1 pint sour cream#@!2 tablespoons white sugar#@!1 teaspoon vanilla extract',
  user_id: (1..20).to_a.sample,
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

# http://allrecipes.com/recipe/25037/best-big-fat-chewy-chocolate-chip-cookie/?internalSource=hub%20recipe&referringId=79&referringContentType=recipe%20hub&clickId=cardslot%2014
Recipe.create!(
  title: 'Best Big, Fat, Chewy Chocolate Chip Cookie',
  description: 'These cookies are the pinnacle of perfection! If you want a big, fat, chewy cookie like the kind you see at bakeries and specialty shops, then these are the cookies for you!',
  ingredients: '2 cups all-purpose flour#@!1/2 teaspoon baking soda#@!1/2 teaspoon salt#@!3/4 cup unsalted butter, melted#@!1 cup packed brown sugar#@!1/2 cup white sugar#@!1 tablespoon vanilla extract 1 egg#@!1 egg yolk#@!2 cups semisweet chocolate chips',
  user_id: (1..20).to_a.sample,
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
  user_id: (1..20).to_a.sample,
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
  user_id: (1..20).to_a.sample,
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
  user_id: (1..20).to_a.sample,
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
  user_id: (1..20).to_a.sample,
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
  user_id: (1..20).to_a.sample,
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


# Recipe.create!(
#   title: '',
#   description: ,
#   ingredients: ,
#   user_id: (1..20).to_a.sample,
#   category_id: 4,
#   prep_time: ,
#   cook_time: ,
#   steps_attributes: [{
#     body: ,
#     order:
#   }
#   ]
# )



# form for recipe create
# Recipe.create!(
#   title: ,
#   description: ,
#   ingredients: ,
#   user_id: (1..20).to_a.sample,
#   category_id: ,
#   prep_time: ,
#   cook_time: ,
#   steps_attributes: [{
#     body: ,
#     order:
#   }
#   ]
# )
