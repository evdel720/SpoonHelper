import merge from 'lodash/merge';

export const stateHelper = (state) => {
  let newStep = merge({}, state);

  newStep.steps = newStep.steps.map((s, idx) => {
    s.order = idx;
    return s;
  });

  newStep.steps = newStep.steps.concat(newStep.stepsToBeDeleted);
  newStep.ingredients = state.ingredients.join("#@!");
  newStep.prep_time = convertToMins(newStep.prep_hour, newStep.prep_min);
  newStep.cook_time = convertToMins(newStep.cook_hour, newStep.cook_min);

  delete newStep['prep_hour'];
  delete newStep['prep_min'];
  delete newStep['cook_hour'];
  delete newStep['cook_min'];
  delete newStep['stepsToBeDeleted'];
  return newStep;
};

const convertToMins = (hourStr, minStr) => {
  let hour = parseInt(hourStr);
  let min = parseInt(minStr);
  if (hour && min) {
    return hour * 60 + min;
  } else if (hour) {
    return hour * 60;
  } else if (min) {
    return min;
  }
};

export const convertToHour = (h, m) => {
  let hs, ms;
  switch (h) {
    case 0:
      h = "";
      hs = "";
      break;
    case 1:
      hs = "hour";
      break;
    default:
      hs = "hours";
  }

  switch (m) {
    case 0:
      m = "";
      ms = "";
      break;
    case 1:
      ms = "min";
      break;
    default:
      ms = 'mins';
  }

  return `${h}${hs} ${m}${ms}`;
};

const sortByKey = (key, order) => {
  return (a, b) => {
    if (a[key] < b[key]){
      return order[0];
    } else if (a[key] > b[key]) {
      return order[1];
    } else {
      return 0;
    }
  };
};


export const sortBy = (keyword, items) => {
  let array = Object.keys(items).map((i) => items[i]);
  if (keyword === 'newest') {
    return array.sort(sortByKey('id', [-1, 1]));
  } else {
    return array.sort(sortByKey('likes', [1, -1]));
  }
};
