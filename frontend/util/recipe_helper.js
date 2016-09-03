import merge from 'lodash/merge';

export const updateState = (state) => {
  let updateStep = merge({}, state);
  updateStep.steps = updateStep.steps.concat(updateStep.stepsToBeDeleted);
  delete updateStep['stepsToBeDeleted'];
  return updateStep;
};


export const reorderSteps = () => {
  let parent = document.getElementById('steps');
  let steps = Array.from(parent.children).filter((node) => node.nodeName !== 'BUTTON');
  steps.forEach((item, idx) => {
    item.name = idx;
  });
};


export const putStepOnForm = (step, deleteHandler, setHandler, idx) => {
  const targetNode = document.getElementById('steps');
  let newForm;
  if (step.body[0] === '0') {
    newForm = document.createElement('textarea');
    newForm.placeholder = 'Step text';
    newForm.value = step.body.slice(1);
    newForm.addEventListener('input', setHandler);
  } else if (step.body[0] === '1') {
    newForm = document.createElement('img');
    newForm.src = step.body.slice(1);
    newForm.style = "{width: 100px; height: 100px;}";
  }

  newForm.name = idx;

  let deleteButton = document.createElement('button');
  deleteButton.innerHTML = "X";
  deleteButton.addEventListener('click', deleteHandler);

  targetNode.appendChild(newForm);
  targetNode.appendChild(deleteButton);
};
