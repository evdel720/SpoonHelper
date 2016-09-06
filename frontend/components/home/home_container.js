import { connect } from 'react-redux';
import Home from './home.jsx';

const mapStateToProps = (state) => ({
  categories: state.categories
});

export default connect(mapStateToProps)(Home);
