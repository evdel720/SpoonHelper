import React from 'react';

const Comment = ({ comment, currentUser, destroyComment }) => {

  const forAuthor = ()=> {
    if (currentUser && currentUser.id === comment.user.id) {
      return <img className='del-icon'
        src="http://res.cloudinary.com/wkdal720/image/upload/v1472937356/delete_pmccwp.png"
        onClick={ () => destroyComment(comment.id) }/>;
    }
  };

  return (
    <li className='comment'>
      { forAuthor() }
      <p className='commentor'>{comment.user.username}</p>
      { comment.content }
    </li>
  );
};

export default Comment;
