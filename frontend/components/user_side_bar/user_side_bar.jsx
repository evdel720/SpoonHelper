import React from 'react';
import { Link } from 'react-router';

const UserSideBar = ({ signedIn, signOut, currentUser }) => {
  if (signedIn) {
    return (
      <ul className="user-side-bar">
        <Link to="/" className="side-link">{currentUser.email}</Link>
        <p className="side-link" onClick={signOut}>Sign Out</p>
      </ul>
    );
  } else {
    return (
      <ul className="user-side-bar">
        <Link to="signin" className="side-link">Sign In</Link>
        <Link to="signup" className="side-link">Sign Up</Link>
      </ul>
    );
  }
};

export default UserSideBar;
