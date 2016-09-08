import React from 'react';
import { withRouter } from 'react-router';
import { convertToHour } from '../../util/recipe_helper.js';

const RecipeIndexItem = ({ item, router }) => {
  const goToDetail = () => {
    router.push(`/recipes/${item.id}`);
  };

  const hourHelper = () => {
    return convertToHour(item.total_cooking);
  };

  const titleHelper = () => {
    let shrinked = item.title;
    if (shrinked.length > 30) {
      shrinked = shrinked.slice(0, 25) + "...";
    }
    return shrinked;
  };

  const usernameHelper = () => {
    let shrinked = item.user;
    if (shrinked.length > 13) {
      shrinked = shrinked.slice(0, 8) + "...";
    }
    return shrinked;
  };

  return (
    <li className="recipe_index_item" onClick={ goToDetail } >
      <img className="rep_img" src={ item.rep_img.slice(1) }/>
      <p className='item_title'>{titleHelper()}</p>
      <div className='item-info'>
        <p className='item_author'>by { usernameHelper() }</p>
        <p className='item_time'>{ hourHelper() }</p>
        <p className='like-count'>{ item.likes } likes</p>
      </div>
    </li>
  );
};

export default withRouter(RecipeIndexItem);
