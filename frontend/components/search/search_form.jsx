import React from 'react';
import { withRouter } from 'react-router';

class SearchForm extends React.Component {
  inputHandler(e) {
    e.preventDefault();
    if (e.target.value !== "") {
      let search_option = e.target.previousSibling.value;
      let search_value = e.target.value;
      this.props.requestSearchAutocomplete({search_option, search_value});
      document.addEventListener('click', () => this.clearForm());
    } else {
      this.props.clearAutocomplete();
    }
  }

  clearForm() {
    document.getElementById('search-input').value = "";
    this.props.clearAutocomplete();
  }

  submitHandler(e) {
    e.preventDefault();
    if (e.target.search_value !== "") {
      let search_option = e.target.search_option.value;
      let search_value = e.target.search_value.value;
      this.props.requestSearchRecipes({search_option, search_value});
      this.props.router.push(`/search`);
    }
  }

  searchResult() {
    {
      return (
        this.props.search.map((r, idx) => (
          <li key={r.id + idx}
            className='autocomplete-item'
            onClick={() => this.props.router.push(`/recipes/${r.id}`)}>
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
        <form className='search-form' onSubmit={this.submitHandler.bind(this)}>
          <select id='select' name='search_option'>
            <option value='title'>Recipe name</option>
            <option value='ingredients'>Ingredient</option>
          </select>
          <input id="search-input" name="search_value" type='text' onChange={ this.inputHandler.bind(this)} placeholder='Search'/>
          <button>
            <img src='http://res.cloudinary.com/wkdal720/image/upload/v1473203868/search_1_gesyxt.png' alt='icon'/>
          </button>
        </form>
        { this.props.search.length ? <ul className='search-dropdown'> {this.searchResult()} </ul> : ""}
      </div>
    );
  }
}

export default withRouter(SearchForm);
