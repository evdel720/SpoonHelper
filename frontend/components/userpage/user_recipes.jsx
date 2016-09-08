import React from 'react';
import { withRouter } from 'react-router';

const UserRecipes = ({ recipes, router }) => {

  const recipeList = recipes.map((r, idx) => {
    return (
      <img key={r + idx} className='userpage-img'
        src={r.rep_img.slice(1)}
        onClick={ () => router.push(`/recipes/${r.id}`)} />
      );
    }
  );


  return (
    <div className="user-created-recipes-page">
      <h1>Your Recipes</h1>
      <ul className="user-page-list">{ recipeList }</ul>
    </div>
  );
};

export default withRouter(UserRecipes);
