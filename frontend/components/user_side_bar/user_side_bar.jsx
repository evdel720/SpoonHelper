import React from 'react';
import { Link } from 'react-router';

class UserSideBar extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      userDropdown: false
    };
    this.hide = this.hide.bind(this);
  }

  show() {
    this.setState({
      userDropdown: true
    });
    document.addEventListener('click', this.hide);
  }

  hide() {
    this.setState({
      userDropdown: false
    });
    document.removeEventListener('click', this.hide);
  }

  dropDown() {
    return (
      <ul className="user-dropdown">
        <Link className="dropdown-item hvr-fade" to="/my_liked">Liked Recipes</Link>
        <Link className="dropdown-item hvr-fade" to="/my_recipes">Created Recipes</Link>
      </ul>
    );
  }

  render() {
    const { signedIn, signOut, currentUser } = this.props;
    if (signedIn) {
      return (
        <ul className="user-side-bar">
          <a className="side-link hvr-fade"
            onClick={ this.show.bind(this) }>
            {currentUser.username} ▾</a>
          { this.state.userDropdown ? this.dropDown() : "" }
          <div className="link-separation"></div>
          <a className="side-link hvr-fade" onClick={signOut}>Sign Out</a>
        </ul>
      );
    } else {
      return (
        <ul className="user-side-bar">
          <Link to="signin" className="side-link">Sign In</Link>
          <div className="link-separation"></div>
          <Link to="signup" className="side-link">Sign Up</Link>
        </ul>
      );
    }
  }
}

export default UserSideBar;
