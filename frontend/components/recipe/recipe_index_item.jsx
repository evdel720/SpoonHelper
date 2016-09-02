import React from 'react';

const RecipeIndexItem = ({ item }) => (
  <li className="recipe-index-item">
    <h4>{item.title}</h4>
    <p>item.user.email</p>
  </li>
);

export default RecipeIndexItem;
