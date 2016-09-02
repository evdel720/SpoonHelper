import { Router, Route, hashHistory, IndexRoute } from 'react-router';
import React from 'react';
import App from './app';
import SignUpFormContainer from './session/sign_up_form_container.js';
import SignInFormContainer from './session/sign_in_form_container.js';
import { clearErrors } from '../actions/error_actions.js';
import { requestCategories } from '../actions/category_actions.js';
import RecipeFormContainer from '../components/recipe/recipe_form_container.js';
import RecipeIndexContainer from '../components/recipe/recipe_index_container.js';

class AppRouter extends React.Component{
  constructor(props){
    super(props);
    this._ensureLoggedIn = this._ensureLoggedIn.bind(this);
    this._redirectIfLoggedIn = this._redirectIfLoggedIn.bind(this);
    this._clearErrorsWhenLeave = this._clearErrorsWhenLeave.bind(this);
    this._fetchCategories = this._fetchCategories.bind(this);
  }

  _fetchCategories(){
    if (this.context.store.getState().categories['1'] === undefined) {
      this.context.store.dispatch(requestCategories());
    }
  }

  _ensureLoggedIn(nextState, replace){
    const currentState = this.context.store.getState();
    const currentUser = currentState.session.currentUser;
    if (!currentUser) {
      replace('/signin');
    }
  }

  _redirectIfLoggedIn(nextState, replace){
    const currentUser = this.context.store.getState().session.currentUser;
    if (currentUser) {
      replace('/');
    }
  }

  _clearErrorsWhenLeave(nextState, replace) {
    this.context.store.dispatch(clearErrors());
  }

  render() {
    return (
      <Router history={hashHistory}>
        <Route path="/" component={ App } onEnter={this._fetchCategories}>
          <Route path="signup" component={SignUpFormContainer}
            onEnter={ this._redirectIfLoggedIn }
            onLeave={ this._clearErrorsWhenLeave } />
          <Route path="signin" component={SignInFormContainer}
            onEnter={ this._redirectIfLoggedIn }
            onLeave={ this._clearErrorsWhenLeave } />
          <Route path="new_recipe" component={ RecipeFormContainer }/>
          <Route path=":categoryTitle" component={ RecipeIndexContainer }/>
        </Route>
      </Router>
    );
  }
}

AppRouter.contextTypes = {
  store: React.PropTypes.object.isRequired
};


export default AppRouter;
