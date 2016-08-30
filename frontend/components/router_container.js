import AppRouter from './router.jsx';
import { connect } from 'react-redux';
import { clearErrors } from '../actions/error_actions.js';

const mapStateToProps = (state) => ({
  currentUser: state.session.currentUser
});

const mapDispatchToProps = (dispatch) => ({
  clearErrors: () => dispatch(clearErrors())
});

export default connect(mapStateToProps, mapDispatchToProps)(AppRouter);
