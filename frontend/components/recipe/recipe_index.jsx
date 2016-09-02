import React from 'react';
import RecipeIndexItem from './recipe_index_item.jsx';

class RecipeIndex extends React.Component {
  componentReceiveProps() {
    this.render();
  }

  render() {
    const { categoryTitle, sortedBy, items } = this.props;
    let itemList = "";
    if (items) {
      itemList = Object.keys(items).map((i, k) => {
        return <RecipeIndexItem key={k}
          item= { items[i] }
          requestSingleRecipe={ this.props.requestSingleRecipe } />;
        }
      );
    }
    
    return (
      <div className="recipe_index">
        <div>{categoryTitle}</div>
        { itemList }
      </div>
    );
  }
}

export default RecipeIndex;
