import { applyMiddleware } from 'redux';
import SessionMiddleware from './session_middleware.js';
import CategoryMiddleware from './category_middleware.js';

const RootMiddleware = applyMiddleware(
  SessionMiddleware,
  CategoryMiddleware
);

export default RootMiddleware;
