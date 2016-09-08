import React from 'react';
import { withRouter } from 'react-router';

class SearchForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      search_option: 'title',
      search_value: ""
    };
    this.clearForm = this.clearForm.bind(this);
  }

  inputHandler(e) {
    e.preventDefault();
    this.setState({
      search_option: e.target.previousSibling.value,
      search_value: e.target.value
    });
    if (e.target.value === "") {
      this.props.clearAutocomplete();
    } else {
      this.props.requestSearchAutocomplete(this.state);
    }
    document.addEventListener('mouseup', this.clearForm );
  }

  clearForm(e) {
    this.setState({search_option: 'title', search_value: ""});
    this.props.clearAutocomplete();
    document.removeEventListener('mouseup', this.clearForm );
  }

  submitHandler(e) {
    e.preventDefault();
    if (this.state.search_value !== "") {
      this.props.requestSearchRecipes(this.state);
      this.props.router.push('/search');
      this.clearForm();
    }
  }

  searchResult() {
    {
      return (
        this.props.search.map((r, idx) => (
          <li key={r.id + idx}
            className='autocomplete-item'
            onMouseDown={() => this.props.router.push(`/recipes/${r.id}`)}>
            <img src={r.rep_img.slice(1)}/>
            <p>{r.title}</p>
          </li>
        ))
      );
    }
  }

  render() {
    return (
      <div className='search-container'>
        <form className='search-form'
          onSubmit={ this.submitHandler.bind(this) }>
          <select id='select' name='search_option'
            value={ this.state.search_option }
            onChange={ (e) => this.setState({search_option: e.target.value })}>
            <option value='title'>Recipe name</option>
            <option value='ingredients'>Ingredient</option>
          </select>
          <input id="search-input"
            name="search_value" type='text' value={ this.state.search_value }
            onChange={ this.inputHandler.bind(this)} placeholder='Search'/>
          <button>
            <img className='hvr-pop'
              src='http://res.cloudinary.com/wkdal720/image/upload/v1473203868/search_1_gesyxt.png' alt='icon'/>
          </button>
        </form>
        { this.props.search.length ? <ul className='search-dropdown'> {this.searchResult()} </ul> : ""}
      </div>
    );
  }
}

export default withRouter(SearchForm);
