import React from 'react';
import { Link } from 'react-router';
import UserSideBarContainer from '../components/user_side_bar/user_side_bar_container.js';

const App = ({children}) => (
  <div>
    <h1>Spoon helper</h1>
    <UserSideBarContainer />
    {children}
  </div>
);

export default App;
