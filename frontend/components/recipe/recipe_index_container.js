import { connect } from 'react-redux';
import RecipeIndex from './recipe_index.jsx';
import { requestSingleRecipe } from '../../actions/recipe_actions.js';

const mapStateToProps = (state) => ({
  categoryTitle: state.recipes.index.category,
  items: state.recipes.index.items
});

const mapDispatchToProps = (dispatch) => ({
  requestSingleRecipe: (rId) => dispatch(requestSingleRecipe(rId))
});

export default connect(mapStateToProps, mapDispatchToProps)(RecipeIndex);
