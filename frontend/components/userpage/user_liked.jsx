import React from 'react';
import { withRouter } from 'react-router';

const UserLiked = ({ recipes, router }) => {

  const recipeList = recipes.map((r, idx) => {
    return (
      <img className='userpage-img'
        src={r.rep_img.slice(1)}
        onClick={ () => router.push(`/recipes/${r.id}`)} />
      );
    }
  );

  return (
    <div className="user-liked-page">
      <h1>Liked Recipes</h1>
      <ul className="user-page-list">{ recipeList }</ul>
    </div>
  );
};

export default withRouter(UserLiked);
