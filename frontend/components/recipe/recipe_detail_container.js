import { connect } from 'react-redux';
import RecipeDetail from './recipe_detail.jsx';
import { destroyRecipe, clearSingleRecipe, requestSingleRecipe } from '../../actions/recipe_actions.js';

const mapStateToProps = (state) => ({
  recipe: state.recipes.detail,
  currentUser: state.session.currentUser
});

const mapDispatchToProps = (dispatch) => ({
  destroyRecipe: (rId) => dispatch(destroyRecipe(rId)),
  clearSingleRecipe: () => dispatch(clearSingleRecipe()),
  requestSingleRecipe: (rId) => dispatch(requestSingleRecipe(rId))
});

export default connect(mapStateToProps, mapDispatchToProps)(RecipeDetail);
