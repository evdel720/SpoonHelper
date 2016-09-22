import React from 'react';
import { withRouter } from 'react-router';

class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      index: Math.floor(Math.random() * 6)
    };
    this.changer = window.setInterval(this.changeIndex.bind(this), 7000);
  }

  changeIndex() {
    this.setState({index: (this.state.index + 1) % 6 });
  }

  componentWillUnmount() {
    window.clearInterval(this.changer);
  }

  suggestionList() {
    let categories = this.props.categories;
    return Object.keys(categories).map((cId) => {
      let eachSuggestion = categories[cId].suggestion;
      return (
        <div key={ cId }
          className='suggestion-container'>
          <div className='texts'  onClick={ () => this.props.router.push(`/recipes/${eachSuggestion.id}`) }>
            <p>Would you like to make some...</p>
            <p>{ eachSuggestion.title }?</p>
          </div>
          <img src={ eachSuggestion.rep_img.slice(1) }/>
        </div>
      );
    });
  }

  categoryTitles() {
    let categories = this.props.categories;
    return Object.keys(categories).map((cId, idx) => {
      return (
        <li key={cId + idx}
          onClick={ () => { this.props.router.push(`/category/${cId}`); }}>
          { categories[cId].title }
        </li>
      );
    });
  }

  render() {
    return (
      <div className="suggestions">
        { this.props.categories ? this.suggestionList()[this.state.index] : "" }
        <div className='category-titles'>
          {this.props.categories ? this.categoryTitles() : ""}
        </div>
      </div>
    );
  }
}

export default withRouter(Home);
