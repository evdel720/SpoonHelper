import { Router, Route, hashHistory, IndexRoute } from 'react-router';
import React from 'react';
import App from './app';
import SignUpFormContainer from './session/sign_up_form_container.js';
import SignInFormContainer from './session/sign_in_form_container.js';

const AppRouter = () => {
  const _redirectIfLoggedIn = () => {

  };

  return (
    <Router history={hashHistory}>
      <Route path="/" component={ App }>
        <Route path="signup" component={SignUpFormContainer}
          onEnter={ _redirectIfLoggedIn }/>
        <Route path="signin" component={SignInFormContainer}
          onEnter={ _redirectIfLoggedIn }/>
      </Route>
    </Router>
  );
};

export default AppRouter;

//TODO context and provider thing.. Do I have to use that way?
// or is it okay to use window.currentUser to check if there's user or not.
