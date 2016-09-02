import React from 'react';
import { withRouter } from 'react-router';

const RecipeIndexItem = ({ item, requestSingleRecipe, router }) => {
  const goToDetail = () => {
    requestSingleRecipe(item.id);
    router.push(`/recipes/${item.id}`);
  };

  return (
    <li className="recipe-index-item" onClick={ goToDetail } >
      <img src={ item.rep_image.slice(1) } style={{width: '400px', height: '300px'}}/>
      <h4>{item.title}</h4>
      <p>{ item.user }</p>
    </li>
  );
};

export default withRouter(RecipeIndexItem);
