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

  componentDidMount() {
    this.props.recipe.steps.forEach((s, idx) => {
      let oldStep = { id: s.id, body: s.body };
      RecipeHelper.putStepOnForm(oldStep, this.stepDeleteHandler, null, idx);
    });
  }

  componentWillReceiveProps(props) {
    this.render();
  }

  componentWillUpdate() {
    RecipeHelper.reorderSteps();
  }

  componentDidUpdate() {
    let submitButton = document.getElementById('submit-btn');
    let errorMessage = document.getElementById('step-length');
    if (this.state.steps.length > 0) {
      errorMessage.innerHTML = "";
      submitButton.disabled = false;
    } else {
      errorMessage.innerHTML = "Step needs to be at least one";
      submitButton.disabled = true;
    }
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

  options() {
    const idTitles = categoryIdTitleSelector(this.props.categories);
    return idTitles.map((idTitle)=> {
      return <option key={idTitle[0]} value={idTitle[0]}>{idTitle[1]}</option>;
    });
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

  errorGenerator(errors) {
    if (errors) {
      return errors.map((e, idx) => (<p key={e.length + idx} className='error'>{e}</p>));
    }
  }

  render() {
    const text = this.props.recipe.id ? "Update Recipe": "New Recipe";
    const { errors } = this.props;
    return (
      <div className='recipe-form-container'>
        <h1 className='form-title'>{text}</h1>
        <form className='recipe-form' onSubmit={this.handleSubmit.bind(this)}>
          <label>Title
            <input
              type='text' name='title'
              value={this.state.title}
              onChange={ this.handleInput }/>
              { this.errorGenerator(errors.title) }

          </label>

          <label>Description
          <textarea
            name='description'
            placeholder="little bit about food"
            value={this.state.description}
            onChange={ this.handleInput }></textarea>
          { this.errorGenerator(errors.description) }
          </label>

          <div className='time-form'>
            <label>Prep time
            <input type='number'
              placeholder="mins"
              value={this.state.prep_time} name='prep_time'
              onChange={ this.handleInput }/>
            { this.errorGenerator(errors.prep_time) }
            </label>

            <label>Cooking time
              <input type='number'
                placeholder="mins"
                value={this.state.cook_time} name='cook_time'
                onChange={ this.handleInput }/>
              { this.errorGenerator(errors.cook_time) }
            </label>
          </div>
          <label>Ingredients
            <textarea
              name='ingredients'
              value={this.state.ingredients}
              onChange={ this.handleInput }></textarea>
            { this.errorGenerator(errors.ingredients) }
          </label>
          <label>Category
            <select name='category_id' onChange={ this.handleInput } value={this.state.category_id}>
              <option selected disabled>Select Category</option>
              { this.options() }
            </select>
            { this.errorGenerator(errors.category) }
          </label>

          <div className='recipe-form-btns'>
            <label>Click to add</label>
            <button
              onClick={this.addSteps.bind(this)}>
              Step</button>
            <button
              onClick={this.uploader.bind(this)}>
              File</button>
            </div>
            <p id='step-length' className='error'></p>
            <div id='steps'>
            </div>


          <input type='submit' id='submit-btn' disabled='true'/>
        </form>

      </div>
    );
  }
}

export default withRouter(RecipeForm);
