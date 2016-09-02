import React from 'react';
import { withRouter } from 'react-router';

class CategoryDropdown extends React.Component {
  clickHandler(cId, cTitle) {
    this.props.requestCategoryRecipes(cId);
    this.props.router.push(`/${cTitle}`);
  }

  categoryList() {
    let categoryIds = Object.keys(this.props.categories);
    return categoryIds.map((cId) => {
      let categoryTitle = this.props.categories[cId].title;
      return (
        <li onClick={ this.clickHandler.bind(this, cId, categoryTitle) }
          className="category-item" key={cId}>
          <p>{categoryTitle}</p>
          <img className="category-img" src={this.props.categories[cId].url}
            alt={categoryTitle}
            style={{width: '100px', height: '100px'}}/>
        </li>
      );
    });
  }

  render() {
    return (
      <div className="category-dropdown">
        <div className="categories">
          {this.categoryList()}
        </div>
      </div>
    );
  }
}

export default withRouter(CategoryDropdown);
