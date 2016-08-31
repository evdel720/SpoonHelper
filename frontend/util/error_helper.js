const errorKeySelector = (errors) => {
  return Object.keys(errors);
};

const errorClearHelper = () => {
  const errorElements = Array.from(document.getElementsByClassName("error"));
  errorElements.forEach((node) => node.remove());
};

const errorGenerator = (errors) => {
  errorClearHelper();
  errorKeySelector(errors).forEach((key) => {
    const targetNode = document.getElementsByName(key)[0];
    errors[key].forEach((error) => {
      let errorNode = document.createElement("p");
      errorNode.className = "error";
      errorNode.textContent = error;
      targetNode.parentNode.insertBefore(errorNode, targetNode.nextSibling);
    });
  });
};

export { errorKeySelector, errorClearHelper, errorGenerator };
