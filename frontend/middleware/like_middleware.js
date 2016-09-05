import { LikeConstants } from '../actions/like_actions.js';
import * as LikeUtil from '../util/like_api_util.js';
import { addLike, removeLike } from '../actions/session_actions.js';

const LikeMiddleware = (store) => (next) => (action) => {
  const addLikeSuccess = (recipe) => {
    store.dispatch(addLike(recipe));
  };

  const removeLikeSuccess = (recipe) => {
    store.dispatch(removeLike(recipe));
  };

  switch (action.type) {
    case LikeConstants.CREATE_LIKE:
      LikeUtil.createLike(action.rId, addLikeSuccess);
      break;
    case LikeConstants.DESTROY_LIKE:
      LikeUtil.destroyLike(action.rId, removeLikeSuccess);
      break;
    default:
      return next(action);
  }
};

export default LikeMiddleware;
