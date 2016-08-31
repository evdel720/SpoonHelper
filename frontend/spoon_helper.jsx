import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { requestCategories } from './actions/category_actions.js';

window.requestCategories = requestCategories;

document.addEventListener("DOMContentLoaded", () => {
  let preloadedState = {
    session: {
      currentUser: undefined,
      signedIn: false
    }
  };
  if (window.currentUser) {
    preloadedState = {
      session: {
        currentUser: window.currentUser.user,
        signedIn: true
      }
    };
  }
  const store = window.store = configureStore(preloadedState);
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store}/>, root);
});
