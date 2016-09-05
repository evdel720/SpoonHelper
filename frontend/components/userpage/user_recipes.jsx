import React from 'react';
import { withRouter } from 'react-router';

const UserRecipes = ({ recipes, router }) => {

  const recipeList = recipes.map((r, idx) => {
    return <li key={idx}
      onClick={ () => router.push(`/recipes/${r.id}`)} >
      { r.title }
    </li>;
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
