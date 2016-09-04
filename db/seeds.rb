
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

seafood_img = Image.create!(url: 'http://res.cloudinary.com/wkdal720/image/upload/v1472947427/seafood_n15nbl.jpg', order: 0)
seafood_img.imageable = seafood
seafood_img.save!

appetizer_img = Image.create!(url: 'http://res.cloudinary.com/wkdal720/image/upload/v1472664911/Appetizers_rw1fgb.jpg', order: 0)
appetizer_img.imageable = appetizers
appetizer_img.save!

breakfast_img = Image.create!(url: 'http://res.cloudinary.com/wkdal720/image/upload/v1472664911/breakfast_v5z2ti.jpg', order: 0)
breakfast_img.imageable = breakfast
breakfast_img.save!

vegetarian_img = Image.create!(url: 'http://res.cloudinary.com/wkdal720/image/upload/v1472664912/Salads_nchpcg.jpg', order: 0)
vegetarian_img.imageable = vegetarian
vegetarian_img.save!

meat_img = Image.create!(url: 'http://res.cloudinary.com/wkdal720/image/upload/v1472664912/Maindish_pkxhrw.jpg', order: 0)
meat_img.imageable = meat
meat_img.save!

desserts_img = Image.create!(url: 'http://res.cloudinary.com/wkdal720/image/upload/v1472664911/Desserts_r0fabf.jpg', order: 0)
desserts_img.imageable = desserts
desserts_img.save!

Recipe.delete_all

# form for recipe create
# Recipe.create!(
#   title: ,
#   description: ,
#   ingredients: ,
#   user_id: ,
#   category_id: ,
#   prep_time: ,
#   cook_time: ,
#   steps_attributes: [{
#     body: ,
#     order:
#   }
#   ]
# )

# step form
# {
#   body: ,
#   order:
# },


# http://allrecipes.com/recipe/76278/orange-pecan-french-toast/?internalSource=staff%20pick&referringId=78&referringContentType=recipe%20hub&clickId=cardslot%202
Recipe.create!(
  title: 'Orange Pecan French Toast',
  description: 'My husband and I were vacationing recently and had this lovely French toast at a bed and breakfast. When we came back home, I kept missing it so I called them up and requested it. They actually gave me the recipe over the phone! I generally halve the recipe for my husband and I, and bake it in an 8 inch square pan. Reheats well in the toaster oven. I served it to my in-laws recently and they loved it. Serve with a little sweetened whipped cream and berries!',
  ingredients: '1 cup packed brown sugar, 1/3 cup butter- melted, 2 tablespoons corn syrup, 1/3 cup chopped pecans, 12 (3/4 inch thick) slices French bread, 1 teaspoon grated orange zest, 1 cup fresh orange juice, 1/2 cup 2% milk, 3 tablespoons white sugar, 1 teaspoon ground cinnamon, 1 teaspoon vanilla extract, 3 egg whites, 2 eggs, 1 tablespoon confectioners\' sugar for dusting',
  user_id: 1,
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
  ingredients: '1 (.25 ounce) package active dry yeast, 1/4 cup warm milk (110 degrees F/45 degrees C), 3 egg yolks, 2 3/4 cups warm milk (110 degrees F/45 degrees C), 3/4 cup butter, melted and cooled to lukewarm, 1/2 cup white sugar, 1 1/2 teaspoons salt, 2 teaspoons vanilla extract, 4 cups all-purpose flour, 3 egg whites',
  user_id: 2,
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
  ingredients: '1 1/2 cups all-purpose flour, 3 1/2 teaspoons baking powder, 1 teaspoon salt, 1 tablespoon white sugar, 1 1/4 cups milk, 1 egg, 3 tablespoons melted butter',
  user_id: 3,
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
