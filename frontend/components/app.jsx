import React from 'react';
import { Link, withRouter } from 'react-router';
import UserSideBarContainer from '../components/user_side_bar/user_side_bar_container.js';

const App = ({children, router}) => {
  const homeLink = () => {
    router.push('/');
  };

  return (
    <div>
      <div className="home">
        <div className="logo" onClick={homeLink}>LOGO</div>
        <UserSideBarContainer />
      </div>
      {children}
    </div>
  );
};

export default withRouter(App);
