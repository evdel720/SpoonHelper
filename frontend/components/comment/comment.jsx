import React from 'react';

const Comment = ({ comment, currentUser, destroyComment }) => {

  const forAuthor = ()=> {
    if (currentUser && currentUser.id === comment.user.id) {
      return <img className='del-icon'
        src="http://res.cloudinary.com/wkdal720/image/upload/v1473204036/remove-icon-png-32_zonmih.png"
        onClick={ () => destroyComment(comment.id) }/>;
    }
  };

  return (
    <li className='comment'>
      <p className='commentor'>
        { forAuthor() }
        {comment.user.username}
      </p>
      <p className='comment-content'>{ comment.content }</p>
    </li>
  );
};

export default Comment;
