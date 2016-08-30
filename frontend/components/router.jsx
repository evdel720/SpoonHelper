import { Router, Route, hashHistory, IndexRoute } from 'react-router';
import React from 'react';
import App from './app';
import SignUpFormContainer from './session/sign_up_form_container.js';
import SignInFormContainer from './session/sign_in_form_container.js';

const AppRouter = () => (
  <Router history={hashHistory}>
    <Route path="/" component={ App }>
      <Route path="signup" component={SignUpFormContainer}/>
      <Route path="signin" component={SignInFormContainer}/>
    </Route>
  </Router>
);

export default AppRouter;
