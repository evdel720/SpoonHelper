import React from 'react';
import RecipeIndexItem from './recipe_index_item.jsx';
import { sortBy } from '../../util/recipe_helper.js';

class RecipeIndex extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      sorting: "newest"
    };
  }

  handleSorting(e) {
    e.preventDefault();
    this.setState({sorting: e.target.value });
  }

  render() {
    const { categoryTitle, items } = this.props;
    let itemList = "";
    if (items) {
      itemList = sortBy(this.state.sorting, items).map((i, k) => {
        return <RecipeIndexItem key={k}
          item= { i } />;
        }
      );
    }


    return (
      <div className="recipe_index_container">
        <h1 className="category_title">{categoryTitle}</h1>
        <select onChange={ this.handleSorting.bind(this) }
          className="index-sorting">
          <option value="newest">Newest</option>
          <option value="likes">Most Likes</option>
        </select>
        <ul className="recipe_index">
          { itemList }
        </ul>
      </div>
    );
  }
}

export default RecipeIndex;
