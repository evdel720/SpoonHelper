import React from 'react';
import { withRouter } from 'react-router';

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
      props.router.push("/#/");
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
      <div>
        <h1>Sign In</h1>
        <form onSubmit={this.handleSubmit.bind(this)}>
          <input type='text'
            name="email"
            onChange={this.handleInput}
            value={this.state.username}
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
