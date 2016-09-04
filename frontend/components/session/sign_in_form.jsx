import React from 'react';
import { withRouter } from 'react-router';

class SignInForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };
    this.handleInput = this.handleInput.bind(this);
  }

  errorGenerator(errors) {
    if (errors) {
      return errors.map((e, idx) => (<p key={e.length + idx} className='error'>{e}</p>));
    }
  }

  componentWillReceiveProps(props) {
    if (props.signedIn) {
      this.props.router.push('/');
    }
    this.render();
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
    this.props.guestSignIn();
  }

  render() {
    const { errors } = this.props;
    return (
      <div className="session-form">
        <h1>Sign In</h1>
        <form className="clearfix" onSubmit={this.handleSubmit.bind(this)}>
          <input type='text'
            name="username"
            onChange={this.handleInput}
            value={this.state.username}
            placeholder="Username"/>
          <input type='password'
            name="password"
            onChange={this.handleInput}
            value={this.state.password}
            placeholder="Password"/>
          { this.errorGenerator(errors.username) }
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
