import React from 'react';
import { categoryIdTitleSelector } from '../../util/category_helper.js';
import merge from 'lodash/merge';

class RecipeForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      title: this.props.recipe.title,
      ingredients: this.props.recipe.ingredients,
      description: this.props.description,
      category_id: this.props.category_id,
      instructions: this.props.instructions ? this.props.instructions : []
    };
    this.handleInput = this.handleInput.bind(this);
    this.instructionSetHandler = this.instructionSetHandler.bind(this);
    this.instructionDeleteHandler = this.instructionDeleteHandler.bind(this);
  }

  handleInput(e) {
    this.setState({[e.target.name]: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    let recipeData = merge({}, this.state);
    delete recipeData['instructions'];
    if (this.props.recipe.id) {
      this.props.updateRecipe({
        recipe: merge({}, recipeData, {id: this.props.recipe.id}),
        instructions: this.state.instructions});
    } else {
      this.props.createRecipe({
        recipe: recipeData,
        instructions: this.state.instructions});
    }
  }

  options() {
    const idTitles = categoryIdTitleSelector(this.props.categories);
    return idTitles.map((idTitle)=> {
      return <option key={idTitle[0]} value={idTitle[0]}>{idTitle[1]}</option>;
    });
  }

  instructionSetHandler(e) {
    let addedState = this.state['instructions'];
    let newValue = addedState[e.target.name];
    newValue.body = e.target.value;
    addedState[e.target.name] = newValue;
    this.setState({'instructions': addedState});
  }

  instructionDeleteHandler(e) {
    let targetStep = e.target.previousSibling;
    e.target.previousSibling.remove();
    e.target.remove();
    let removedState = this.state['instructions'];
    removedState.splice(parseInt(targetStep.name), 1);
    this.setState({
      'instructions': removedState
      });
  }

  addSteps() {
    let newStep = {id: null, body: "", type: 'step'};
    this.setState({'instructions': this.state['instructions'].concat(newStep)});

    const targetNode = document.getElementById('instructions');
    let newForm = document.createElement('textarea');
    newForm.placeholder = 'Step text';
    newForm.name = this.state.instructions.length;

    newForm.addEventListener('input', this.instructionSetHandler);

    let deleteButton = document.createElement('button');
    deleteButton.innerHTML = "X";

    deleteButton.addEventListener('click', this.instructionDeleteHandler);

    targetNode.appendChild(newForm);
    targetNode.appendChild(deleteButton);
  }

  componentWillUpdate() {
    let parent = document.getElementById('instructions');
    let instructions = Array.from(parent.children).filter((node) => node.nodeName !== 'BUTTON');
    instructions.forEach((item, idx) => {
      item.name = idx;
    });
  }

  addFile(file, type) {
    let newFile = {id: null, url: file.url, type: type};
    this.setState({'instructions': this.state['instructions'].concat(newFile)});
    const targetNode = document.getElementById('instructions');
    let imageTag = document.createElement('img');
    imageTag.src = file.thumbnail_url;

    let deleteButton = document.createElement('button');
    deleteButton.innerHTML = "X";
    deleteButton.addEventListener('click', this.instructionDeleteHandler);

    targetNode.appendChild(imageTag);
    targetNode.appendChild(deleteButton);
  }

  handleFiles(error, result) {
    if (error === null) {
      let files = Array.from(result);
      files.forEach((file) => {
        if (file.resource_type === 'image') {
          this.addFile(file, 'image');
        } else if (file.resource_type === 'video') {
          this.addFile(file, 'video');
        } else {
          this.props.receiveErrors({
            instruction: ["Invalid file type."]});
        }
      });
    } else {
      this.props.receiveErrors({
        instruction: ["Uploading went wrong. Please try again."]});
    }
  }

  uploader() {
    cloudinary.openUploadWidget(window.cloudinary_options,
      this.handleFiles.bind(this)
    );
  }

  render() {
    return (
      <div className='recipe-form-container'>
        <form className='recipe-form' onSubmit={this.handleSubmit.bind(this)}>
          <input placeholder='Title'
            type='text' name='title'
            onChange={ this.handleInput }/>

          <textarea placeholder='Ingredients'
            name='ingredients'
            onChange={ this.handleInput }></textarea>

          <textarea placeholder='Description'
            name='description'
            onChange={ this.handleInput }></textarea>

          <select name='category_id' onChange={ this.handleInput }>
            <option selected disabled>Select Category</option>
            { this.options() }
          </select>

          <div id='instructions'>

          </div>
          <button>{this.props.recipe.id ? "Update Recipe": "New Recipe"}</button>
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

export default RecipeForm;
