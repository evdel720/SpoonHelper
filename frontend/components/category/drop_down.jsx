import React from 'react';

class CategoryDropdown extends React.Component {
  categoryList() {
    let categoryIds = Object.keys(this.props.categories);
    return categoryIds.map((cId) => {
      return (
        <li className="category-item" key={cId}>
          <p>{this.props.categories[cId].title}</p>
          <img className="category-img" src={this.props.categories[cId].url}
            alt={this.props.categories[cId].title}
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

export default CategoryDropdown;
