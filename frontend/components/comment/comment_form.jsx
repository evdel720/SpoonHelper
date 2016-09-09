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
      this.setState({content: ""});
    }
  }

  render() {
    let placeholder = this.props.signedIn ? "Leave your comment here!" : "Please sign in to leave your comment.";
    return (
      <form onSubmit={this.handleSubmit.bind(this)}>
        <textarea
          onChange={this.handleInput.bind(this)}
          placeholder={ placeholder }
          value={this.state.content}
          disabled={this.props.signedIn ? false : true }>
        </textarea>
        <button id='submit-btn'
          disabled={this.props.signedIn && this.state.content !== "" ? false : true }>
          Add
        </button>
      </form>
    );
  }
}

export default CommentForm;
