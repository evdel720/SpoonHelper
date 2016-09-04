import merge from 'lodash/merge';

export const stateHelper = (state) => {
  let newStep = merge({}, state);

  newStep.steps = newStep.steps.map((s, idx) => {
    s.order = idx;
    return s;
  });

  newStep.steps = newStep.steps.concat(newStep.stepsToBeDeleted);
  newStep.ingredients = state.ingredients.join("#@!");
  delete newStep['stepsToBeDeleted'];
  return newStep;
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
    newForm.className = 'step-textarea';
    newForm.value = step.body.slice(1);
    newForm.addEventListener('input', setHandler);
  } else if (step.body[0] === '1') {
    newForm = document.createElement('img');
    newForm.src = step.body.slice(1);
    newForm.className = 'step-img';
  }

  newForm.name = idx;

  let deleteButton = document.createElement('button');
  deleteButton.innerHTML = "X";
  deleteButton.addEventListener('click', deleteHandler);
  deleteButton.className = "delete-btn";

  targetNode.appendChild(newForm);
  targetNode.appendChild(deleteButton);
};
