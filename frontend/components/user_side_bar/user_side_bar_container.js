import { connect } from 'react-redux';
import UserSideBar from './user_side_bar.jsx';
import { signOut } from '../../actions/session_actions.js';

const mapStateToProps = (state) => ({
  signedIn: state.session.signedIn,
  currentUser: state.session.currentUser
});

const mapDispatchToProps = (dispatch) => ({
  signOut: () => dispatch(signOut())
});

export default connect(mapStateToProps, mapDispatchToProps)(UserSideBar);
