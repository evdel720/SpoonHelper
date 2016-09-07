import { Router, Route, hashHistory, IndexRoute } from 'react-router';
import React from 'react';
import App from './app';
import SignUpFormContainer from './session/sign_up_form_container.js';
import SignInFormContainer from './session/sign_in_form_container.js';
import { clearErrors } from '../actions/error_actions.js';
import { requestCategories } from '../actions/category_actions.js';
import { clearSingleRecipe, requestSingleRecipe, requestCategoryRecipes } from '../actions/recipe_actions.js';
import RecipeFormContainer from '../components/recipe/recipe_form_container.js';
import RecipeIndexContainer from '../components/recipe/recipe_index_container.js';
import RecipeDetailContainer from '../components/recipe/recipe_detail_container.js';
import UserLikedContainer from '../components/userpage/user_liked_container.js';
import UserRecipesContainer from '../components/userpage/user_recipes_container.js';
import HomeContainer from '../components/home/home_container.js';


class AppRouter extends React.Component{
  constructor(props){
    super(props);
    this._newRecipePrepare = this._newRecipePrepare.bind(this);
    this._editRecipePrepare = this._editRecipePrepare.bind(this);
    this._redirectIfLoggedIn = this._redirectIfLoggedIn.bind(this);
    this._clearErrorsWhenLeave = this._clearErrorsWhenLeave.bind(this);
    this._fetchCategories = this._fetchCategories.bind(this);
    this._fetchCategoryRecipes = this._fetchCategoryRecipes.bind(this);
    this._fetchSingleRecipe = this._fetchSingleRecipe.bind(this);
    this._ensureSignedIn = this._ensureSignedIn.bind(this);
  }

  _fetchCategoryRecipes(nextState, replace) {
    this.context.store.dispatch(requestCategoryRecipes(nextState.params.cId));
  }

  _fetchSingleRecipe(nextState, replace) {
    this.context.store.dispatch(requestSingleRecipe(nextState.params.rId));
  }

  _fetchCategories(){
    if (this.context.store.getState().categories['1'] === undefined) {
      this.context.store.dispatch(requestCategories());
    }
  }

  _newRecipePrepare(nextState, replace){
    this.context.store.dispatch(clearSingleRecipe());
    const currentState = this.context.store.getState();
    const currentUser = currentState.session.currentUser;
    if (!currentUser) {
      replace('/signin');
    }
  }

  _editRecipePrepare(nextState, replace){
    const currentState = this.context.store.getState();
    const currentUser = currentState.session.currentUser;
    if (!currentUser) {
      replace('/signin');
    } else if (currentState.recipes.detail.id === undefined) {
      replace('/new_recipe');
    } else if (currentUser.id !== currentState.recipes.detail.user.id) {
      replace('/');
    }
  }

  _redirectIfLoggedIn(nextState, replace){
    const currentUser = this.context.store.getState().session.currentUser;
    if (currentUser) {
      replace('/');
    }
  }

  _clearErrorsWhenLeave() {
    this.context.store.dispatch(clearErrors());
  }

  _ensureSignedIn(nextState, replace){
    const currentState = this.context.store.getState();
    const currentUser = currentState.session.currentUser;
    if (!currentUser) {
      replace('/signin');
    }
  }

  render() {
    return (
      <Router history={hashHistory}>
        <Route path="/" component={ App } onEnter={this._fetchCategories}>
          <IndexRoute component={ HomeContainer } />
          <Route path="signup" component={SignUpFormContainer}
            onEnter={ this._redirectIfLoggedIn }
            onLeave={ this._clearErrorsWhenLeave } />
          <Route path="signin" component={SignInFormContainer}
            onEnter={ this._redirectIfLoggedIn }
            onLeave={ this._clearErrorsWhenLeave } />
          <Route path="new_recipe" component={ RecipeFormContainer }
            onEnter={ this._newRecipePrepare }
            onLeave={ this._clearErrorsWhenLeave } />
          <Route path="edit_recipe" component={ RecipeFormContainer }
            onEnter={ this._editRecipePrepare }
            onLeave={ this._clearErrorsWhenLeave } />
          <Route path="category/:cId" component={ RecipeIndexContainer }
            onEnter={ this._fetchCategoryRecipes } />
          <Route path="recipes/:rId" component={ RecipeDetailContainer }
            onEnter={ this._fetchSingleRecipe }/>
          <Route path="my_liked" component={ UserLikedContainer }
            onEnter={ this._ensureSignedIn } />
          <Route path="my_recipes" component={ UserRecipesContainer }
            onEnter={ this._ensureSignedIn } />
          <Route path="search" component={ RecipeIndexContainer }/>
        </Route>
      </Router>
    );
  }
}

AppRouter.contextTypes = {
  store: React.PropTypes.object.isRequired
};


export default AppRouter;
