```json
{
  session: {
    currentUser: {
      email: "spoon_helper@current.com",
      bio: "My cool cooking story",
      likes: [recipeId1, recipeId2],
      collections: [recipeId1, recipeId2],
    },
    loggedIn: true
  },

  errors: [],

  loading: false,

  categories: {
    items: {
      1: {
        title: "Mexican",
        image: "Mexican.jpg",
        suggestion: recipeObject1
      },
      2: {
        title: "Italian",
        image: "Italian.jpg",
        suggestion: recipeObject2
      }
    }
  },

  recipes: {
    category: categoryTitle, / "search result" if it is search result
    sortingBy: ["created_at", "asc"],
    items {
      1: {
        title: "Recipe Index1",
        user: userObject,
        rep_image: "image.jpg",
        likes: 12
      },
      2: {
        title: "Recipe Index2",
        user: userObject,
        rep_image: "image.jpg",
        likes: 31
      }
    }
  },

  recipe: {
    title: "Recipe Index1",
    description: "Delicious sandwich",
    ingredients: ["bread", "lettuce", "turkey", "tomato", "edamame"],
    user: userObject,
    steps: [stepOb1, stepOb2],
    comments: [commentOb1, commentOb2],
    rep_image: "image.jpg",
    likes: 12
  },

  search: {
    1: {
      title: "Found Recipe 1",
      image: "image.jpg"
    },
    2: {
      title: "Found Recipe 2",
      image: "image.jpg"
    }
  }
}
```
