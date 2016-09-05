import React from 'react';
import { withRouter } from 'react-router';
import CommentForm from '../comment/comment_form.jsx';
import Comment from '../comment/comment.jsx';

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
          <img src="http://res.cloudinary.com/wkdal720/image/upload/v1472937348/edit_qdlixp.png" alt="edit" onClick={this.editHandler.bind(this)}/>
          <img src="http://res.cloudinary.com/wkdal720/image/upload/v1472937356/delete_pmccwp.png" alt="delete" onClick={this.deleteHandler.bind(this)}/>
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
    return ingredients.split("#@!").map((i, idx) => {
      return <li key={idx} className='ingredient'>{ i }</li>;
    });
  }

  commentList() {
    let comments = this.props.recipe.comments;
    if (comments.length) {
      return comments.map((c) => <Comment
        key={c.id}
        comment={c}
        currentUser={this.props.currentUser}
        destroyComment={this.props.destroyComment}/>);
    }
  }

  likeToggle(e) {
    e.preventDefault();
    if (this.props.signedIn) {
      if (this.userLiked()) {
        this.props.destroyLike(this.props.recipe.id);
      } else {
        this.props.createLike(this.props.recipe.id);
      }
    }
  }

  userLiked() {
    const { currentUser, recipe } = this.props;
    let likedRecipeIds = currentUser.liked_recipes.map((r) => r.id);
    if (likedRecipeIds.includes(recipe.id)) {
      return true;
    } else {
      return false;
    }
  }

  render() {
    const { title, user, description, ingredients,
      category, prep_time, cook_time, steps, id, likes } = this.props.recipe;

    return (
      <div className='detail-container'>
        <div className="recipe-detail">
          <div className="ingredient-part">
            <label>Category
              <p>{category ? category.title : ""}</p>
            </label>

            <label>Ingredients
              <ul className="ingredient-list">
                {ingredients ? this.ingredientsHelper(ingredients) : ""}
              </ul>
            </label>
          </div>
          <div className="recipe-all-part">
            <h1 className="detail-title">
              <button
                className={ this.props.signedIn && this.userLiked() ? "unlike-btn" : "like-btn"}
                onClick={ this.likeToggle.bind(this) }
                disabled={ this.props.signedIn ? false : true }
                >❤ { likes } </button>
              {title}
            </h1>
            <h4 className="detail-user">Uploaded by {user ? user.username : ""}
              { this.forAuthor() }
            </h4>
            <div className='time'>
              <h5>Prep {prep_time} mins</h5>
              <h5>Cook {cook_time} mins</h5>
            </div>

            <label>Description
              <p>{description}</p>
            </label>

            <label>Steps
              <ol id='steps-list'>
                { this.putSteps(steps) }
              </ol>
            </label>
          </div>
        </div>

        <div className='comment-part'>
          <CommentForm
            createComment={ this.props.createComment }
            rId={id}
            signedIn={ this.props.signedIn } />
          <label>Comments
            <ul className='comments-list'>
              { this.commentList() }
            </ul>
          </label>
        </div>
      </div>
    );
  }
}

export default withRouter(RecipeDetail);
