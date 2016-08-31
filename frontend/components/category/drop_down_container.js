import { connect } from 'react-redux';
import CategoryDropdown from './drop_down.jsx';

const mapStateToProps = (state) => ({
  categories: state.categories
});

const mapDispatchToProps = (dispatch) => ({
});

export default connect(mapStateToProps, null)(CategoryDropdown);
