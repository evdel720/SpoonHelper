import React from 'react';
import { withRouter } from 'react-router';

class SignUpForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: "",
      password_confirmation: ""
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
    this.props.signUp({
      user: {
        username: this.state.username,
        password: this.state.password
      }
    });
  }

  render() {
    const { password, password_confirmation, username } = this.state;
    const { errors } = this.props;
    return (
      <div className="session-form">
        <img className="session-form-logo" src="http://res.cloudinary.com/wkdal720/image/upload/v1472659523/imageedit_1_3889917060_vq3dui.png" alt="logo"/>
        <form onSubmit={this.handleSubmit.bind(this)}>
          <input type='text'
            name="username"
            onChange={this.handleInput}
            value={ username }
            placeholder="Username"/>
          { this.errorGenerator(errors.username) }

          <input type='password'
            name="password"
            onChange={this.handleInput}
            value={ password }
            placeholder="Password"/>
          { this.errorGenerator(errors.password) }

          <input type='password'
            name="password_confirmation"
            onChange={this.handleInput}
            placeholder="Password Confirmation"
            value={ password_confirmation }/>
          <p className='error'>
            { password !==  password_confirmation ? "The password confirmation doesn't match with password." : ""}
          </p>

          <button className="btn-submit"
            disabled={ password === '' || password !== password_confirmation ? true : false }
            >Sign Up</button>
        </form>
      </div>
    );
  }
}

export default withRouter(SignUpForm);
