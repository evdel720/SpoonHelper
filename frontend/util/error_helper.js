const errorKeySelector = (errors) => {
  return Object.keys(errors);
};

const errorClearHelper = () => {
  const errorElements = Array.from(document.getElementsByClassName("error"));
  errorElements.forEach((node) => node.remove());
};

export { errorKeySelector, errorClearHelper };
