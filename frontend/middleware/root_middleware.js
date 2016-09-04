import { applyMiddleware } from 'redux';
import SessionMiddleware from './session_middleware.js';
import CategoryMiddleware from './category_middleware.js';
import RecipeMiddleware from './recipe_middleware.js';
import CommentMiddleware from './comment_middleware.js';

const RootMiddleware = applyMiddleware(
  SessionMiddleware,
  CategoryMiddleware,
  RecipeMiddleware,
  CommentMiddleware
);

export default RootMiddleware;
