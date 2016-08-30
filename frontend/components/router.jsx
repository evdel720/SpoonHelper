import { Router, Route, hashHistory, IndexRoute } from 'react-router';
import React from 'react';
import App from './app';
import SignUpFormContainer from './session/sign_up_form_container.js';
import SignInFormContainer from './session/sign_in_form_container.js';

const AppRouter = ({ router }) => {
  const _redirectIfLoggedIn = (nextState, replace) => {
    if (window.currentUser) {
      replace("/#/");
    }
  };

  const _ensureSignedIn = (nextState, replace) => {
    if (window.currentUser === undefined) {
      replace('/signin');
    }
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
