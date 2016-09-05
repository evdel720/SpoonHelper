```json
{
  session: {
    currentUser: {
      id: 1,
      username: "spoon_helper@current.com",
      likes: [recipeId1, recipeId2],
    },
    signedIn: true
  },

  errors: {
    username: ["username is too short", "Password can't be blank"],
    password: ["Password can't be blank"]
  },

  loading: false,

  categories: {
    1: {
      title: "Mexican",
      suggestion: recipeObject1
    },
    2: {
      title: "Italian",
      suggestion: recipeObject2
    }
  },

  recipes: {
    index: {
      category: categoryTitle, / "search result" if it is search result
      sortedBy: ["created_at", "asc"],
      items {
        1: {
          title: "Recipe Index1",
          user: userId,
          rep_image_url: "image_url",
          likes: 12
        },
        2: {
          title: "Recipe Index2",
          user: userId,
          rep_image_url: "image_url",
          likes: 31
        }
      },
    detail: {
        id: 1,
        title: "Recipe Index1",
        description: "Delicious sandwich",
        ingredients: ["bread", "lettuce", "turkey", "tomato", "edamame"],
        instruction: "detailed instruction...",
        user: userObject,
        comments: [commentOb1, commentOb2],
        rep_image_url: "image.jpg",
        video_url: "video_url",
        likes: 12
      },
    }
  },


  search: {
    1: {
      title: "Found Recipe 1",
      rep_image_url: "image.jpg"
    },
    2: {
      title: "Found Recipe 2",
      rep_image_url: "image.jpg"
    }
  }
}
```
