import React from 'react';
import { withRouter } from 'react-router';
import { errorKeySelector, errorClearHelper } from '../../util/error_helper.js';

class SignInForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      email: "",
      password: ""
    };
    this.handleInput = this.handleInput.bind(this);
  }

  componentWillReceiveProps(props) {
    if (props.signedIn) {
      props.router.push("/");
    } else if (props.errors) {
      errorClearHelper();
      const targetNode = document.getElementsByName('password')[0];
      let errorNode = document.createElement("p");
      errorNode.className = "error";
      errorNode.textContent = "Invalid email or password";
      targetNode.parentNode.insertBefore(errorNode, targetNode.nextSibling);
    }
  }

  handleInput(e) {
    this.setState({[e.target.name]: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.signIn({user: this.state});
  }

  render() {
    return (
      <div className="session-form">
        <h1>Sign In</h1>
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
          <button>Sign In</button>
        </form>
      </div>
    );
  }
}

export default withRouter(SignInForm);
