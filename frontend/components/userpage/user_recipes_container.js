import { connect } from 'react-redux';
import UserRecipes from './user_recipes.jsx';

const mapStateToProps = (state) => ({
  recipes: state.session.currentUser.recipes
});

export default connect(mapStateToProps)(UserRecipes);
