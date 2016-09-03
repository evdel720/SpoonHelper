import React from 'react';
import { withRouter } from 'react-router';

class RecipeDetail extends React.Component{
  editHandler() {
    this.props.router.push(`/edit_recipe`);
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
          <img src="http://res.cloudinary.com/wkdal720/image/upload/v1472937348/edit_qdlixp.png" onClick={this.editHandler.bind(this)}/>
          <img src="http://res.cloudinary.com/wkdal720/image/upload/v1472937356/delete_pmccwp.png" onClick={this.deleteHandler.bind(this)}/>
        </div>
      );
    }
    return "";
  }

  putEachStepOnPage(step) {
    if (step.body[0] === '0') {
      return <li key={step.id} className='step-text'>{ step.body.slice(1) }</li>;
    } else if (step.body[0] === '1') {
      return <img key={step.id} className='step-img' src={ step.body.slice(1) }/>;
    }
  }

  putSteps(steps) {
    if (steps.length) {
      return steps.map((s) => this.putEachStepOnPage(s));
    }
  }

  ingredientsHelper(ingredients) {
    return ingredients.split(", ").map((i, idx) => {
      return <li key={idx} className='ingredient'>{ i }</li>;
    });
  }

  render() {
    const { title, user, description, ingredients,
      category, prep_time, cook_time, steps } = this.props.recipe;

    return (
      <div className="recipe-detail">
        <h1 className="detail-title">{title}</h1>
        <h4 className="detail-user">Uploaded by {user ? user.email : ""}
          { this.forAuthor() }
        </h4>
        <div className='time'>
          <h5>Prep {prep_time} mins</h5>
          <h5>Cook {cook_time} mins</h5>
        </div>

        <label>Category
          <p>{category ? category.title : ""}</p>
        </label>

        <label>Description
          <p>{description}</p>
        </label>

        <label>Ingredients
          <ul className="ingredient-list">
            {ingredients ? this.ingredientsHelper(ingredients) : ""}
          </ul>
        </label>

        <label>Steps
          <ol id='steps-list'>
            { this.putSteps(steps) }
          </ol>
        </label>
      </div>
    );
  }
}

export default withRouter(RecipeDetail);
