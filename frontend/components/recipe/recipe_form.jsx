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
      ingredients: ingredients ? ingredients.split("#@!") : [],
      description: description || "",
      prep_hour: Math.floor(prep_time / 60) || "",
      prep_min: prep_time % 60 || "",
      cook_hour: Math.floor(cook_time / 60) || "",
      cook_min: cook_time % 60 || "",
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
    if (this.props.recipe.id) {
      this.props.updateRecipe(
        this.props.recipe.id,
        RecipeHelper.stateHelper(this.state));
    } else {
      this.props.createRecipe({
        recipe: RecipeHelper.stateHelper(this.state)
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
    let targetIndex = parseInt(e.target.previousSibling.name);
    let marked = this.state.steps[targetIndex].id;
    if (marked) {
      this.setState({
        stepsToBeDeleted: this.state.stepsToBeDeleted.concat({id: marked, _destroy: '1'})
      });
    }
    let removedState = this.state.steps;
    removedState.splice(targetIndex, 1);
    this.setState({
      steps: removedState
    });
  }

  stepSetHandler(e) {
    let addedState = this.state.steps;
    let newValue = addedState[e.target.name];
    newValue.body = "0" + e.target.value;
    addedState[e.target.name] = newValue;
    this.setState({steps: addedState});
  }

  addSteps(e) {
    e.preventDefault();
    let newStep = { id: null, body: "0" };
    this.setState({steps: this.state.steps.concat(newStep)});
  }

  addFile(file) {
    let newFile = {id: null, body: "1" + file.url };
    this.setState({steps: this.state.steps.concat(newFile)});
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
      return errors.map((e, idx) => (<p key={e + idx} className='error'>{e}</p>));
    }
  }

  ingredientsHandle() {
    return this.state.ingredients.map((ingredient, idx) => (
      <li key={ingredient + idx}
        className='ingredient'
        onClick={this.deleteIngredient.bind(this)}>
        { ingredient }
      </li>
    ));
  }

  addIngredient(e) {
    e.preventDefault();
    let inputForm = e.target.previousSibling;
    if (inputForm.value !== "") {
      this.setState({'ingredients': this.state.ingredients.concat(inputForm.value)});
      inputForm.value = "";
    }
  }

  deleteIngredient(e) {
    e.preventDefault();
    let deleteVal = e.target.innerText;
    let newIngredients = this.state.ingredients;
    newIngredients.splice(newIngredients.indexOf(deleteVal), 1);
    this.setState({'ingredients': newIngredients});
  }

  stepList(steps) {
    return steps.map((s, idx) => {
      if (s.body[0] === '0') {
        return (
          <div key={s + idx} className='step-item'>
            <textarea placeholder="step text goes here"
              name={idx}
              className='step-textarea step-value-node'
              onChange={ this.stepSetHandler }
              value={ s.body.slice(1) } >
            </textarea>
            <button className="delete-btn"
              onClick={ this.stepDeleteHandler }>X</button>
          </div>
        );
      } else {
        return (
          <div key={s + idx} className='step-item'>
            <img src={s.body.slice(1)}
              name={idx}
              className='step-img step-value-node'/>
            <button className="delete-btn"
              onClick={ this.stepDeleteHandler }>X</button>
          </div>
        );
      }
    });
  }

  componentWillReceiveProps(nextProps) {
    if (!nextProps.recipe.id && !Object.keys(nextProps.errors).length) {
      this.setState({
        title: "",
        ingredients: [],
        description: "",
        prep_time: "",
        cook_time: "",
        category_id: undefined,
        steps: [],
        stepsToBeDeleted: []
      });
      this.render();
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
              placeholder="Tell us a little bit about your recipe!"
              value={this.state.description}
              onChange={ this.handleInput }></textarea>
            { this.errorGenerator(errors.description) }
          </label>

          <div className='time-form'>
            <label>Prep time
              <input min='0' type='number'
                placeholder="hours"
                value={this.state.prep_hour} name='prep_hour'
                onChange={ this.handleInput }/>
              <input min='0' type='number'
                placeholder="mins"
                value={this.state.prep_min} name='prep_min'
                onChange={ this.handleInput }/>
              { this.errorGenerator(errors.prep_time) }
            </label>

            <label>Cook time
              <input min='0' type='number'
                placeholder="hours"
                value={this.state.cook_hour} name='cook_hour'
                onChange={ this.handleInput }/>
              <input min='0' type='number'
                placeholder="mins"
                value={this.state.cook_min} name='cook_min'
                onChange={ this.handleInput }/>
              { this.errorGenerator(errors.cook_time) }
            </label>
          </div>

          <label>Ingredients
            { this.state.ingredients.length ? <ul className='ingredient-list-in-form'>{ this.ingredientsHandle() }</ul> : ""}
            <div id='ingredient-form-container'>
              <input type='text'
                name='ingredient'
                placeholder="add each ingredient"/>
              <button id="ingredient-btn" onClick={ this.addIngredient.bind(this) }>+</button>
            </div>
            { this.errorGenerator(errors.ingredients) }
          </label>

          <label>Category
            <select name='category_id' onChange={ this.handleInput } value={this.state.category_id}>
              <option selected disabled>Select Category</option>
              { this.options() }
            </select>
            { this.errorGenerator(errors.category_id) }
          </label>

          <label>Click buttons below to add steps</label>

            <p className='error'>
              {this.state.steps.length ? "" : "Every recipe needs at least one step"}
            </p>

            <div id='steps'>
              { this.state.steps.length ? this.stepList(this.state.steps) : ""}
            </div>

            <div className='recipe-form-btns'>
              <button
                onClick={this.addSteps.bind(this)}>
                Text</button>
              <button
                onClick={this.uploader.bind(this)}>
                Image</button>
            </div>

          <input type='submit'
            id='submit-btn'
            disabled={ this.state.steps.length ? false : true } />
        </form>

      </div>
    );
  }
}

export default withRouter(RecipeForm);
