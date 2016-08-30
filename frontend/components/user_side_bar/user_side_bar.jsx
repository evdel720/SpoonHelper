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
      <div className="user-side-bar">
        <Link to="signin">Sign In</Link>
        <Link to="signup">Sign Up</Link>
      </div>
    );
  }
};

export default UserSideBar;
