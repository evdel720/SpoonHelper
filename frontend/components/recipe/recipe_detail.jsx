import React from 'react';
import { withRouter } from 'react-router';

class RecipeDetail extends React.Component{
  editHandler() {

  }

  deleteHandler() {
    if (window.confirm("Are you sure? It will delete this recipe!")) {
      this.props.destroyRecipe(this.props.recipe.id);
      this.props.router.push(`/${this.props.recipe.category.id}`);
    }
  }

  forAuthor() {
    const user = this.props.recipe.user;
    const currentUser = this.props.currentUser;
    if (currentUser && user && currentUser.id === user.id) {
      return (
        <div className='author-buttons'>
          <button>Edit</button>
          <button onClick={this.deleteHandler.bind(this)}>Delete</button>
        </div>
      );
    }
    return "";
  }

  putEachStepOnPage(step) {
    if (step.body[0] === '0') {
      return <li key={step.id} className='step-item'>{ step.body.slice(1) }</li>;
    } else if (step.body[0] === '1') {
      return <img key={step.id} className='step-item' src={ step.body.slice(1) } style={{width: '300px', height: '200px'}}/>;
    }
  }

  putSteps(steps) {
    if (steps.length) {
      return steps.map((s) => this.putEachStepOnPage(s));
    }
  }

  render() {
    const { title, user, description, ingredients,
      category, prep_time, cook_time, steps } = this.props.recipe;

    return (
      <div className="recipe-detail">
        <h1>{title}</h1>
        <h3>Uploaded by {user ? user.email : ""}</h3>
        { this.forAuthor() }
        <h3>Description : {description}</h3>
        <h3>Ingredients : {ingredients}</h3>
        <h3>Category : {category ? category.title : ""}</h3>
        <h3>Prep Time : {prep_time} mins</h3>
        <h3>Cook Time : {cook_time} mins</h3>
        <ol id='steps'>
          { this.putSteps(steps) }
        </ol>
      </div>
    );
  }
}

export default withRouter(RecipeDetail);
