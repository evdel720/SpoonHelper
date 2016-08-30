import React from 'react';
import { Link } from 'react-router';

const UserSideBar = ({ signedIn, signOut, currentUser }) => {
  if (signedIn) {
    return (
      <div className="user-side-bar">
        <h4>Welcome, {currentUser.email}</h4>
        <button onClick={signOut}>Sign Out</button>
      </div>
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
