import React from 'react';
import { Link } from 'react-router';

const UserSideBar = ({ signedIn, signOut, currentUser }) => {
  if (signedIn) {
    return (
      <ul className="user-side-bar">
        <Link to="/" className="side-link">{currentUser.username}</Link>
        <div className="link-separation"></div>
        <a className="side-link" onClick={signOut}>Sign Out</a>
      </ul>
    );
  } else {
    return (
      <div className="user-side-bar">
        <Link to="signin" className="side-link">Sign In</Link>
        <div className="link-separation"></div>
        <Link to="signup" className="side-link">Sign Up</Link>
      </div>
    );
  }
};

export default UserSideBar;
