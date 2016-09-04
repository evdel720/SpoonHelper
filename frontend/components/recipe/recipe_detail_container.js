import { connect } from 'react-redux';
import RecipeDetail from './recipe_detail.jsx';
import { destroyRecipe, clearSingleRecipe, requestSingleRecipe } from '../../actions/recipe_actions.js';
import { createComment, destroyComment } from '../../actions/comment_actions.js';

const mapStateToProps = (state) => ({
  recipe: state.recipes.detail,
  currentUser: state.session.currentUser,
  signedIn: state.session.signedIn
});

const mapDispatchToProps = (dispatch) => ({
  destroyRecipe: (rId) => dispatch(destroyRecipe(rId)),
  clearSingleRecipe: () => dispatch(clearSingleRecipe()),
  requestSingleRecipe: (rId) => dispatch(requestSingleRecipe(rId)),
  createComment: (comment, rId) => dispatch(createComment(comment, rId)),
  destroyComment: (comment) => dispatch(destroyComment(comment))
});

export default connect(mapStateToProps, mapDispatchToProps)(RecipeDetail);
