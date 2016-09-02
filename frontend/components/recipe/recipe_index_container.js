import { connect } from 'react-redux';
import RecipeIndex from './recipe_index.jsx';

const mapStateToProps = (state) => ({
  categoryTitle: state.recipes.index.category,
  sortedBy: state.recipes.index.sortedBy,
  items: state.recipes.index.items
});

export default connect(mapStateToProps)(RecipeIndex);
