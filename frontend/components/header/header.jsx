import React from 'react';
import UserSideBarContainer from '../user_side_bar/user_side_bar_container.js';
import { Link, withRouter } from 'react-router';
import CategoryDropDownContainer from '../category/drop_down_container.js';
import SearchFormContainer from '../search/search_form_container.js';

class Header extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      categoryVisible: false
    };
    this.hide = this.hide.bind(this);
  }

  homeLink() {
    this.props.router.push('/');
  }

  show() {
    this.setState({
      categoryVisible: true
    });
    document.addEventListener('click', this.hide);
  }

  hide() {
    this.setState({
      categoryVisible: false
    });
    document.removeEventListener('click', this.hide);
  }

  render () {
    return (
      <header className="home">
        <img id='logo' onClick={this.homeLink.bind(this)} src="http://res.cloudinary.com/wkdal720/image/upload/v1472659523/imageedit_1_3889917060_vq3dui.png" alt="logo"/>
        <div className="include-search">
          <SearchFormContainer />
          <div className="side-bars">
            <div className="home-side-bar">
              <a className="side-link hvr-fade" onClick={this.show.bind(this)} >Categories ▾</a>
              { this.state.categoryVisible ? <CategoryDropDownContainer /> : "" }
              <div className="link-separation"></div>
              <Link className="side-link hvr-fade" to="/new_recipe">New Recipe</Link>
            </div>
            <UserSideBarContainer />
          </div>
        </div>
      </header>
    );
  }
}

export default withRouter(Header);
