import { Router, Route, hashHistory, IndexRoute } from 'react-router';
import React from 'react';
import App from './app';

const AppRouter = () => (
  <Router history={hashHistory}>
    <Route path="/" component={ App }>
    </Route>
  </Router>
);

export default AppRouter;
