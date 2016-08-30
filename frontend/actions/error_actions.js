const ErrorConstants = {
  RECEIVE_ERRORS: "RECEIVE_ERRORS",
  CLEAR_ERRORS: "CLEAR_ERRORS"
};

const receiveErrors = (errors) => ({
  type: ErrorConstants.RECEIVE_ERRORS,
  errors
});

const clearErrors = () => ({
  type: ErrorConstants.CLEAR_ERRORS
});

export { ErrorConstants, receiveErrors, clearErrors };
