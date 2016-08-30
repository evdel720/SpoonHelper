import React from 'react';
import { withRouter } from 'react-router';

class SignUpForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      email: "",
      password: "",
      password_confirmation: "",
      bio: ""
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
    this.props.signUp({user: this.state});
  }

  render() {
    return (
      <div>
        <h1>Sign Up</h1>
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

          <input type='password'
            name="password_confirmation"
            onChange={this.handleInput}
            value={this.state.password_confirmation}
            placeholder="Password Confirmation"/>

          <textarea name="bio"
            defaultValue={this.state.bio}
            placeholder="Biography"
            onChange={this.handleInput}>
          </textarea>

          <button>Sign Up</button>
        </form>
      </div>
    );
  }
}

export default withRouter(SignUpForm);
