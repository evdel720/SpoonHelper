export const SearchConstants = {
  REQUEST_SEARCH_AUTOCOMPLETE: "REQUEST_SEARCH_AUTOCOMPLETE",
  RECEIVE_SEARCH_AUTOCOMPLETE: "RECEIVE_SEARCH_AUTOCOMPLETE",
  CLEAR_AUTO_COMPLETE: "CLEAR_AUTO_COMPLETE"
};

export const requestSearchAutocomplete = (data) => ({
  type: SearchConstants.REQUEST_SEARCH_AUTOCOMPLETE,
  data
});

export const receiveSearchAutocomplete = (recipes) => ({
  type: SearchConstants.RECEIVE_SEARCH_AUTOCOMPLETE,
  recipes
});

export const clearAutocomplete = () => ({
  type: SearchConstants.CLEAR_AUTO_COMPLETE
});
