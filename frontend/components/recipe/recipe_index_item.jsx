import React from 'react';
import { withRouter } from 'react-router';
import { convertToHour } from '../../util/recipe_helper.js';

const RecipeIndexItem = ({ item, router }) => {
  const goToDetail = () => {
    router.push(`/recipes/${item.id}`);
  };

  const hourHelper = () => {
    let h = Math.floor(item.total_cooking / 60);
    let m = item.total_cooking % 60;
    return convertToHour(h, m);
  };

  return (
    <li className="recipe_index_item" onClick={ goToDetail } >
      <img className="rep_img" src={ item.rep_img.slice(1) }/>
      <p className='item_title'>{item.title}</p>
      <div className='item-info'>
        <p className='item_author'>by { item.user }</p>
        <p className='item_time'>{ hourHelper() }</p>
        <p className='like-count'>{ item.likes } likes</p>
      </div>
    </li>
  );
};

export default withRouter(RecipeIndexItem);
