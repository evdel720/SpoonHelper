import React from 'react';
import { withRouter } from 'react-router';

class CategoryDropdown extends React.Component {
  clickHandler(cId) {
    this.props.router.push(`category/${cId}`);
  }

  categoryList() {
    let categoryIds = Object.keys(this.props.categories);
    return categoryIds.map((cId) => {
      let categoryTitle = this.props.categories[cId].title;
      return (
        <li onClick={ this.clickHandler.bind(this, cId) }
          className="category-item" key={cId}>
          <p>{categoryTitle}</p>
          <img className="category-img" src={this.props.categories[cId].url}
            alt={categoryTitle}/>
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
        <p className='see-all' onClick={ this.clickHandler.bind(this, 0) }>
          See All Recipes
        </p>
      </div>
    );
  }
}

export default withRouter(CategoryDropdown);
