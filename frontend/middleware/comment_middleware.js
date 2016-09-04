import { CommentConstants } from '../actions/comment_actions.js';
import { addComment, deleteComment } from '../actions/recipe_actions.js';
import * as CommentUtil from '../util/comment_api_util.js';
import { receiveErrors } from '../actions/error_actions.js';

const CommentMiddleware = (store) => (next) => (action) => {
  const createSuccess = (comment) => {
    store.dispatch(addComment(comment));
  };

  const errorCallback = (errors) => {
    store.dispatch(receiveErrors(errors.responseJSON));
  };

  const deleteSuccess = (comment) => {
    store.dispatch(deleteComment(comment));
  };

  switch (action.type) {
    case CommentConstants.CREATE_COMMENT:
      CommentUtil.createComment(action.comment, action.rId, createSuccess, errorCallback);
      break;
    case CommentConstants.DESTROY_COMMENT:
      CommentUtil.destroyComment(action.commentId, deleteSuccess);
      break;
    default:
      return next(action);
  }
};

export default CommentMiddleware;
