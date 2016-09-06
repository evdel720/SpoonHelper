import React from 'react';
import { withRouter } from 'react-router';

const RecipeIndexItem = ({ item, router }) => {
  const goToDetail = () => {
    router.push(`/recipes/${item.id}`);
  };

  return (
    <li className="recipe_index_item" onClick={ goToDetail } >
      <img className="rep_img" src={ item.rep_img.slice(1) }/>
      <p className='item_title'>{item.title}</p>
      <p className='item_author'>by { item.user }</p>
      <p className='item_time'>{ item.total_cooking } mins</p>
      <p className='like-count'> ❤ { item.likes }</p>
    </li>
  );
};

export default withRouter(RecipeIndexItem);
