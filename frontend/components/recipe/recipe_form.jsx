import React from 'react';
import { categoryIdTitleSelector } from '../../util/category_helper.js';
import * as RecipeHelper from '../../util/recipe_helper.js';
import { withRouter } from 'react-router';

class RecipeForm extends React.Component {
  constructor(props) {
    super(props);
    const { title, ingredients, description, prep_time, cook_time, category, steps } = this.props.recipe;
    this.state = {
      title: title || "",
      ingredients: ingredients || "",
      description: description || "",
      prep_time: prep_time || "",
      cook_time: cook_time || "",
      category_id: category ? category.id : undefined,
      steps: steps || [],
      stepsToBeDeleted: []
    };
    this.handleInput = this.handleInput.bind(this);
    this.stepSetHandler = this.stepSetHandler.bind(this);
    this.stepDeleteHandler = this.stepDeleteHandler.bind(this);
  }

  handleInput(e) {
    this.setState({[e.target.name]: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    let steps = this.state.steps.map((s, idx) => {
      s.order = idx;
      return s;
    });
    this.setState({steps: steps});
    if (this.props.recipe.id) {
      this.props.updateRecipe(
        this.props.recipe.id,
        RecipeHelper.updateState(this.state));
    } else {
      this.props.createRecipe({
        recipe: this.state
      });
    }
  }

  stepDeleteHandler(e) {
    let targetStep = e.target.previousSibling;
    let targetStepIndex = parseInt(targetStep.name);
    let marked = this.state.steps[targetStepIndex].id;
    if (marked) {
      this.setState({
        'stepsToBeDeleted': this.state.stepsToBeDeleted.concat({id: marked, _destroy: '1'})
      });
    }
    targetStep.remove();
    e.target.remove();

    let removedState = this.state['steps'];
    removedState.splice(parseInt(targetStep.name), 1);
    this.setState({
      'steps': removedState
    });
  }

  options() {
    const idTitles = categoryIdTitleSelector(this.props.categories);
    return idTitles.map((idTitle)=> {
      return <option key={idTitle[0]} value={idTitle[0]}>{idTitle[1]}</option>;
    });
  }

  stepSetHandler(e) {
    let addedState = this.state['steps'];
    let newValue = addedState[e.target.name];
    newValue.body = "0" + e.target.value;
    addedState[e.target.name] = newValue;
    this.setState({'steps': addedState});
  }

  addSteps() {
    let newStep = { id: null, body: "0" };
    this.setState({'steps': this.state['steps'].concat(newStep)});
    RecipeHelper.putStepOnForm(newStep, this.stepDeleteHandler, this.stepSetHandler);
  }

  componentWillUpdate() {
    RecipeHelper.reorderSteps();
  }

  addFile(file) {
    let newFile = {id: null, body: "1" + file.url };
    this.setState({'steps': this.state['steps'].concat(newFile)});
    RecipeHelper.putStepOnForm(newFile, this.stepDeleteHandler, null, this.state.steps.length - 1);
  }

  handleFiles(error, result) {
    if (error === null) {
      let files = Array.from(result);
      files.forEach((file) => {
        this.addFile(file);
      });
    }
  }

  uploader() {
    cloudinary.openUploadWidget(window.cloudinary_options,
      this.handleFiles.bind(this)
    );
  }

  componentDidMount() {
    this.props.recipe.steps.forEach((s, idx) => {
      let oldStep = { id: s.id, body: s.body };
      RecipeHelper.putStepOnForm(oldStep, this.stepDeleteHandler, null, idx);
    });
  }

  componentDidUpdate() {
    let submitButton = document.getElementById('submit-btn');
    if (this.state.steps.length > 0) {
      submitButton.disabled = false;
    } else {
      submitButton.disabled = true;
    }
  }

  render() {
    return (
      <div className='recipe-form-container'>
        <form className='recipe-form' onSubmit={this.handleSubmit.bind(this)}>
          <input placeholder='Title'
            type='text' name='title'
            value={this.state.title}
            onChange={ this.handleInput }/>

          <textarea placeholder='Description'
            name='description'
            value={this.state.description}
            onChange={ this.handleInput }></textarea>

          <input placeholder="Prep Time" type='number'
            value={this.state.prep_time} name='prep_time'
            onChange={ this.handleInput }/>

          <input placeholder="Cook Time" type='number'
            value={this.state.cook_time} name='cook_time'
            onChange={ this.handleInput }/>

          <textarea placeholder='Ingredients'
            name='ingredients'
            value={this.state.ingredients}
            onChange={ this.handleInput }></textarea>

          <select name='category_id' onChange={ this.handleInput } value={this.state.category_id}>
            <option selected disabled>Select Category</option>
            { this.options() }
          </select>

          <div id='steps'>
          </div>
          <button id='submit-btn' disabled="true">
            {this.props.recipe.id ? "Update Recipe": "New Recipe"}
          </button>
        </form>

        <button
          onClick={this.addSteps.bind(this)}>
          Add a text step</button>
        <button
          onClick={this.uploader.bind(this)}>
          Add Images/Videos</button>
      </div>
    );
  }
}

export default withRouter(RecipeForm);

// const targetNode = document.getElementById('steps');
// let imageTag = document.createElement('img');
// imageTag.src = file.thumbnail_url;
//
// let deleteButton = document.createElement('button');
// deleteButton.innerHTML = "X";
// deleteButton.addEventListener('click', this.stepDeleteHandler);
//
// targetNode.appendChild(imageTag);
// targetNode.appendChild(deleteButton);


  // putStepOnForm(step, idx) {
  //   const targetNode = document.getElementById('steps');
  //   let newForm = document.createElement('textarea');
  //   newForm.placeholder = 'Step text';
  //   newForm.name = idx;
  //   newForm.value = step.body.slice(1);
  //
  //   newForm.addEventListener('input', this.stepSetHandler);
  //
  //   let deleteButton = document.createElement('button');
  //   deleteButton.innerHTML = "X";
  //
  //   deleteButton.addEventListener('click', this.stepDeleteHandler);
  //
  //   targetNode.appendChild(newForm);
  //   targetNode.appendChild(deleteButton);
  // }
