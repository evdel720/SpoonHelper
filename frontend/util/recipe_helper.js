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
