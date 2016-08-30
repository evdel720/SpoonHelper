const SessionConstants = {
  SIGN_IN: "SIGN_IN",
  SIGN_UP: "SIGN_UP",
  SIGN_OUT: "SIGN_OUT",
  RECEIVE_CURRENT_USER: "RECEIVE_CURRENT_USER",
  RECEIVE_ERRORS: "RECEIVE_ERRORS"
};

const signIn = (user) => ({
  type: SessionConstants.SIGN_IN,
  user
});

const signUp = (user) => ({
  type: SessionConstants.SIGN_UP,
  user
});

const signOut = () => ({
  type: SessionConstants.SIGN_OUT
});

const receiveCurrentUser = (user) => ({
  type: SessionConstants.RECEIVE_CURRENT_USER,
  user
});

const receiveErrors = (errors) => ({
  type: SessionConstants.RECEIVE_ERRORS,
  errors
});

export { SessionConstants, signIn, signUp, signOut,
        receiveCurrentUser, receiveErrors };
