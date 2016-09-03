import React from 'react';
import { withRouter } from 'react-router';
import { errorGenerator } from '../../util/error_helper.js';

class SignUpForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      email: "",
      password: "",
      bio: ""
    };
    this.handleInput = this.handleInput.bind(this);
  }

  componentWillReceiveProps(props) {
    if (props.signedIn) {
      this.props.router.push('/');
    } else if (props.errors) {
      errorGenerator(props.errors);
    }
  }

  handleConfirmation(e) {
    document.getElementsByClassName("confirmation")[0].remove();
    const targetNode = document.getElementsByName("password_confirmation")[0];
    const submitButton = document.getElementsByClassName("btn-submit")[0];
    let errorNode = document.createElement("p");
    errorNode.className = "confirmation";

    if (this.state.password !== e.target.value) {
      submitButton.disabled = true;
      errorNode.textContent = "The password confirmation doesn't match with password.";
    } else {
      submitButton.disabled = false;
      errorNode.textContent = "Password confirmation matches.";
    }
    targetNode.parentNode.insertBefore(errorNode, targetNode.nextSibling);
  }

  handleInput(e) {
    this.setState({[e.target.name]: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.signUp({user: this.state});
  }

  render() {
    return (
      <div className="session-form">
        <h1>Sign Up</h1>
        <form onSubmit={this.handleSubmit.bind(this)}>
          <input type='text'
            name="email"
            onChange={this.handleInput}
            value={this.state.email}
            placeholder="Email"/>

          <input type='password'
            name="password"
            onChange={this.handleInput}
            value={this.state.password}
            placeholder="Password"/>

          <input type='password'
            name="password_confirmation"
            onChange={this.handleConfirmation.bind(this)}
            placeholder="Password Confirmation"/>
          <p className="confirmation"></p>

          <textarea name="bio"
            defaultValue={this.state.bio}
            placeholder="Biography"
            onChange={this.handleInput}>
          </textarea>

          <button className="btn-submit">Sign Up</button>
        </form>
      </div>
    );
  }
}

export default withRouter(SignUpForm);
