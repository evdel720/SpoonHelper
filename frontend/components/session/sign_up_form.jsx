import React from 'react';
import { withRouter } from 'react-router';
import { errorKeySelector, errorClearHelper } from '../../util/error_helper.js';

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
      props.router.push("/");
    } else if (props.errors) {
      errorClearHelper();
      errorKeySelector(props.errors).forEach((key) => {
        const targetNode = document.getElementsByName(key)[0];
        props.errors[key].forEach((error) => {
          let errorNode = document.createElement("p");
          errorNode.className = "error";
          errorNode.textContent = error;
          targetNode.parentNode.insertBefore(errorNode, targetNode.nextSibling);
        });
      });
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
        <form className="session-form" onSubmit={this.handleSubmit.bind(this)}>
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
