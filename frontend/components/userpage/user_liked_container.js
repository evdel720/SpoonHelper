import { connect } from 'react-redux';
import UserLiked from './user_liked.jsx';

const mapStateToProps = (state) => ({
  recipes: state.session.currentUser.liked_recipes
});

export default connect(mapStateToProps)(UserLiked);
