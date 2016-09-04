import React from 'react';
import { withRouter } from 'react-router';

class SignUpForm extends React.Component {
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

  handleConfirmation(e) {
    let error = document.getElementById('confirmation');
    const submitButton = document.getElementsByClassName("btn-submit")[0];
    if (this.state.password !== e.target.value) {
      submitButton.disabled = true;
      error.innerHTML = "The password confirmation doesn't match with password.";
      error.style = "color: red;";
    } else {
      submitButton.disabled = false;
      error.style = "color: green;";
      error.innerHTML = "Password confirmation matches.";
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
    const { errors } = this.props;
    return (
      <div className="session-form">
        <h1>Sign Up</h1>
        <form onSubmit={this.handleSubmit.bind(this)}>
          <input type='text'
            name="username"
            onChange={this.handleInput}
            value={this.state.username}
            placeholder="Username"/>
          { this.errorGenerator(errors.username) }

          <input type='password'
            name="password"
            onChange={this.handleInput}
            value={this.state.password}
            placeholder="Password"/>
          { this.errorGenerator(errors.password) }

          <input type='password'
            name="password_confirmation"
            onChange={this.handleConfirmation.bind(this)}
            placeholder="Password Confirmation"/>
          <p id="confirmation" className='error'></p>

          <button className="btn-submit">Sign Up</button>
        </form>
      </div>
    );
  }
}

export default withRouter(SignUpForm);
