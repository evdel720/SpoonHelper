import React from 'react';
import { Link, withRouter } from 'react-router';
import UserSideBarContainer from '../components/user_side_bar/user_side_bar_container.js';

const App = ({children, router}) => {
  const homeLink = () => {
    router.push('/');
  };

  return (
    <div>
      <header className="home">
        <div className="home-side-bar">
          <img className="logo" src="http://res.cloudinary.com/wkdal720/image/upload/v1472649807/logo_if0mvm.png" alt="logo"/>
          <a className="side-link">Categories</a>
          <div className="link-separation"></div>
          <Link className="side-link" to="/">New Recipe</Link>
        </div>
        <UserSideBarContainer />
      </header>
      {children}
    </div>
  );
};

export default withRouter(App);
