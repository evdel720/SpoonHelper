import RecipeForm from './recipe_form.jsx';
import { connect } from 'react-redux';
import { receiveErrors } from '../../actions/error_actions.js';
import { createRecipe, updateRecipe, requestSingleRecipe } from '../../actions/recipe_actions.js';

const mapStateToProps = (state) => ({
  categories: state.categories,
  recipe: state.recipes.detail,
  currentUser: state.session.currentUser
});

const mapDispatchToProps = (dispatch) => ({
  receiveErrors: (errors) => dispatch(receiveErrors(errors)),
  createRecipe: (data) => dispatch(createRecipe(data)),
  updateRecipe: (rId, recipe) => dispatch(updateRecipe(rId, recipe)),
  requestSingleRecipe: (rId) => dispatch(requestSingleRecipe(rId))
});

export default connect(mapStateToProps, mapDispatchToProps)(RecipeForm);
