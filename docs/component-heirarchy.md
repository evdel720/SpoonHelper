## Component Heirarchy

**SignUpFormContainer**
- SignUpForm

**SignInFormContainer**
- SignInForm

**HomeContainer**
- Home
- NavBar
- CategoryIndexContainer
  - CategoryIndex
  - CategoryDetailContainer
    - CategoryDetail

**UserInfoContainer**
- UserInfo

**RecipeIndexContainer**
- RecipeIndex
  - RecipeIndexItem

**RecipeDetailContainer**
- RecipeDetail
- StepIndexContainer
  - StepIndex
    - StepIndexItem
- CommentIndexContainer
  - CommentIndex
    - CommentIndexItem
- CommentFormContainer
  - CommentForm

**RecipeFormContainer**
- RecipeForm

**SearchFormContainer**


## Routes

|Path                                                | Component               |
|----------------------------------------------------|-------------------------|
| "/sign-up"                                         | "SignUpFormContainer"   |
| "/sign-in"                                         | "SignInFormContainer"   |
| "/"                                                | "HomeContainer"         |
| "/user-info"                                       | "UserInfoContainer"     |
| "/recipes/categoryTitle(/title=search_title)"      | "RecipeIndexContainer"  |
| "/recipes/recipeTitle"                             | "RecipeDetailContainer" |
| "/recipes/recipeTitle/edit"                        | "RecipeFormContainer"   |
| "/new-recipe"                                      | "RecipeFormContainer"   |
