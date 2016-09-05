import React from 'react';
import { withRouter } from 'react-router';

const UserLiked = ({ recipes, router }) => {

  const recipeList = recipes.map((r, idx) => {
    return <li key={idx}
      onClick={ () => router.push(`/recipes/${r.id}`)} >
      { r.title }
    </li>;
    }
  );

  return (
    <div className="user-liked-page">
      <h1>Liked Recipes</h1>
      <ul>{ recipeList }</ul>
    </div>
  );
};

export default withRouter(UserLiked);
