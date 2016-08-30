import React from 'react';
import { Link } from 'react-router';
import UserSideBarContainer from '../components/user_side_bar/user_side_bar_container.js';

const App = ({children}) => (
  <div>
    <div className="home">
      <div className="logo"></div>
      <UserSideBarContainer />
    </div>
    {children}
  </div>
);

export default App;
