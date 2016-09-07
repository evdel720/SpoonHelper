import React from 'react';
import RecipeIndexItem from './recipe_index_item.jsx';

class RecipeIndex extends React.Component {
  render() {
    const { categoryTitle, sortedBy, items } = this.props;
    let itemList = "";
    if (items) {
      itemList = Object.keys(items).map((i, k) => {
        return <RecipeIndexItem key={k}
          item= { items[i] } />;
        }
      );
    }

    return (
      <div className="recipe_index_container">
        <h1 className="category_title">{categoryTitle}</h1>
        <select>
          <option></option>
        </select>
        <ul className="recipe_index">
          { itemList }
        </ul>
      </div>
    );
  }
}

export default RecipeIndex;
