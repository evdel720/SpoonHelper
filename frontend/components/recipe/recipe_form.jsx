import React from 'react';
import { categoryIdTitleSelector } from '../../util/category_helper.js';

class RecipeForm extends React.Component {
  constructor(props) {
    super(props);
  }

  handleSubmit(e) {
    e.preventDefault();
    console.log(e.target.elements);
  }

  options() {
    const idTitles = categoryIdTitleSelector(this.props.categories);
    return idTitles.map((idTitle)=> {
      return <option key={idTitle[0]} value={idTitle[0]}>{idTitle[1]}</option>;
    });
  }

  addSteps() {
    const targetNode = document.getElementById('instruction');
    let newForm = document.createElement('textarea');
    newForm.placeholder = 'Step text';
    newForm.name = 'steps';
    targetNode.appendChild(newForm);
  }

  addImages(error, result) {
    if (error === null) {
      let images = Array.from(result).map((img) => img.url);
      const targetNode = document.getElementById('instruction');
      images.forEach((img) => {
        let imageTag = document.createElement('img');
        imageTag.src = img;
        imageTag.name = 'image_urls';
        imageTag.style = "max-width: 200px; max-height: 200px;";
        targetNode.appendChild(imageTag);
      });
    } else {
      this.props.receiveErrors({
        image: ["Image upload went wrong. Please try again."]});
    }
  }

  imageUploader() {
    cloudinary.openUploadWidget(window.cloudinary_options,
      this.addImages.bind(this)
    );
  }

  render() {
    return (
      <div className='recipe-form-container'>
        <form className='recipe-form' onSubmit={this.handleSubmit.bind(this)}>
          <input placeholder='Title' type='text' name='title'/>

          <textarea placeholder='Ingredients' name='ingredients'></textarea>

          <textarea placeholder='Description' name='description'></textarea>

          <select name='category_id'>
            <option selected disabled>Select Category</option>
            { this.options() }
          </select>

          <div id='instruction'></div>
          <button>New Recipe</button>
        </form>

        <button
          onClick={this.addSteps.bind(this)}>
          Add a text step</button>
        <button
          onClick={this.imageUploader.bind(this)}>
          Add Images</button>
        <button
          onClick={this.imageUploader.bind(this)}>
          Add a video</button>
      </div>
    );
  }
}

export default RecipeForm;
