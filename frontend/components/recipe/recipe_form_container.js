import RecipeForm from './recipe_form.jsx';
import { connect } from 'react-redux';
import { receiveErrors } from '../../actions/error_actions.js';

const mapStateToProps = (state) => ({
  categories: state.categories
});

const mapDispatchToProps = (dispatch) => ({
  receiveErrors: (errors) => dispatch(receiveErrors(errors))
});

export default connect(mapStateToProps, mapDispatchToProps)(RecipeForm);
