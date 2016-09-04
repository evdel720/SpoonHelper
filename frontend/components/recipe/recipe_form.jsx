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
    e.preventDefault();
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

  addSteps(e) {
    e.preventDefault();
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

  uploader(e) {
    e.preventDefault();
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
    const text = this.props.recipe.id ? "Update Recipe": "New Recipe";
    return (
      <div className='recipe-form-container'>
        <h1 className='form-title'>{text}</h1>
        <form className='recipe-form' onSubmit={this.handleSubmit.bind(this)}>
          <label>Title
            <input
              type='text' name='title'
              value={this.state.title}
              onChange={ this.handleInput }/>
          </label>

          <label>Description
          <textarea
            name='description'
            placeholder="little bit about food"
            value={this.state.description}
            onChange={ this.handleInput }></textarea>
          </label>

          <div className='time-form'>
            <label>Prep time
            <input type='number'
              placeholder="mins"
              value={this.state.prep_time} name='prep_time'
              onChange={ this.handleInput }/>
            </label>

            <label>Cooking time
              <input type='number'
                placeholder="mins"
                value={this.state.cook_time} name='cook_time'
                onChange={ this.handleInput }/>
            </label>
          </div>
          <label>Ingredients
            <textarea
              name='ingredients'
              value={this.state.ingredients}
              onChange={ this.handleInput }></textarea>
          </label>
          <label>Category
            <select name='category_id' onChange={ this.handleInput } value={this.state.category_id}>
              <option selected disabled>Select Category</option>
              { this.options() }
            </select>
          </label>

          <div className='recipe-form-btns'>
            <label>Steps click to add</label>
            <button
              onClick={this.addSteps.bind(this)}>
              Step</button>
            <button
              onClick={this.uploader.bind(this)}>
              File</button>
            </div>

            <div id='steps'>
            </div>


          <input type='submit' id='submit-btn' disabled='true'/>
        </form>

      </div>
    );
  }
}

export default withRouter(RecipeForm);
