import React from 'react';
import { withRouter } from 'react-router';

const UserRecipes = ({ recipes, router }) => {

  const recipeList = recipes.map((r, idx) => {
    return (
      <div key={idx} className='userpage-item'>
        <li className='userpage-title'
          onClick={ () => router.push(`/recipes/${r.id}`)} >
          { r.title }</li>
        <img className='userpage-img' src={r.rep_img.slice(1)}/>
      </div>
    );
    }
  );

  return (
    <div className="user-created-recipes-page">
      <h1>Your Recipes</h1>
      <ul>{ recipeList }</ul>
    </div>
  );
};

export default withRouter(UserRecipes);
