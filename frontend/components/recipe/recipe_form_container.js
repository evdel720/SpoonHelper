import RecipeForm from './recipe_form.jsx';
import { connect } from 'react-redux';
import { receiveErrors } from '../../actions/error_actions.js';
import { createRecipe, updateRecipe } from '../../actions/recipe_actions.js';

const mapStateToProps = (state) => ({
  categories: state.categories,
  recipe: state.recipes.detail
});

const mapDispatchToProps = (dispatch) => ({
  receiveErrors: (errors) => dispatch(receiveErrors(errors)),
  createRecipe: (data) => dispatch(createRecipe(data)),
  updateRecipe: (data) => dispatch(updateRecipe(data))
});

export default connect(mapStateToProps, mapDispatchToProps)(RecipeForm);
