import SignInForm from './sign_in_form.jsx';
import { connect } from 'react-redux';
import { signIn, guestSignIn } from '../../actions/session_actions.js';

const mapStateToProps = (state) => ({
  signedIn: state.session.signedIn,
  errors: state.errors
});

const mapDispatchToProps = (dispatch) => ({
  signIn: (user) => dispatch(signIn(user)),
  guestSignIn: () => dispatch(guestSignIn())
});

export default connect(mapStateToProps, mapDispatchToProps)(SignInForm);
