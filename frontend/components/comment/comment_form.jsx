import React from 'react';

class CommentForm extends React.Component{
  constructor(props) {
    super(props);
    this.state = {
      content: ""
    };
  }

  handleInput(e) {
    this.setState({content: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    if (this.props.signedIn) {
      this.props.createComment(this.state, this.props.rId);
      e.target.children[0].value = "";
    }
  }

  render() {
    let placeholder = this.props.signedIn ? "Leave your comment here!" : "Please sign in to leave your comment.";
    return (
      <form onSubmit={this.handleSubmit.bind(this)}>
        <textarea
          onChange={this.handleInput.bind(this)}
          placeholder={ placeholder }
          disabled={this.props.signedIn ? false : true }>
          {this.state.content}
        </textarea>
        <button className="comment-btn"
          disabled={this.props.signedIn ? false : true }>
          Add
        </button>
      </form>
    );
  }
}

export default CommentForm;
