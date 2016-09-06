import { connect } from 'react-redux';
import SearchForm from './search_form.jsx';
import { requestSearchRecipes } from '../../actions/recipe_actions.js';
import { requestSearchAutocomplete, clearAutocomplete } from '../../actions/search_actions.js';

const mapStateToProps = (state) => ({
  search: state.search
});

const mapDispatchToProps = (dispatch) => ({
  requestSearchRecipes: (data) => dispatch(requestSearchRecipes(data)),
  requestSearchAutocomplete: (data) => dispatch(requestSearchAutocomplete(data)),
  clearAutocomplete: () => dispatch(clearAutocomplete())
});

export default connect(mapStateToProps, mapDispatchToProps)(SearchForm);
