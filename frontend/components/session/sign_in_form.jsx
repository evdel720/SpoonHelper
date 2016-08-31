import React from 'react';
import { withRouter } from 'react-router';
import { errorGenerator } from '../../util/error_helper.js';

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
      errorGenerator(props.errors);
    }
  }

  handleInput(e) {
    this.setState({[e.target.name]: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.signIn({user: this.state});
  }

  toSignUpPage() {
    this.props.router.push('/signup');
  }

  guestSignIn() {
    console.log("Not implemented yet");
  }

  render() {
    return (
      <div className="session-form">
        <h1>Sign In</h1>
        <form className="clearfix" onSubmit={this.handleSubmit.bind(this)}>
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

        <p>Don't have an account?</p>
        <div className="btns">
          <button className="signin-btn" onClick={ this.toSignUpPage.bind(this) }>Sign Up</button>
          <button className="signin-btn" onClick={ this.guestSignIn.bind(this) }>Guest Sign In</button>
        </div>
      </div>
    );
  }
}

export default withRouter(SignInForm);
