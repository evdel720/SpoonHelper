import { connect } from 'react-redux';
import CategoryDropdown from './drop_down.jsx';
import { requestCategoryRecipes } from '../../actions/recipe_actions.js';

const mapStateToProps = (state) => ({
  categories: state.categories
});

const mapDispatchToProps = (dispatch) => ({
  requestCategoryRecipes: (cId) => dispatch(requestCategoryRecipes(cId))
});

export default connect(mapStateToProps, mapDispatchToProps)(CategoryDropdown);
