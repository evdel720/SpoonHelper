const LoadingConstants = {
  TOGGLE_LOADING_STATUS: "TOGGLE_LOADING_STATUS"
};

const toggleLoadingStatus = () => ({
  type: LoadingConstants.TOGGLE_LOADING_STATUS
});

export { LoadingConstants, toggleLoadingStatus };
